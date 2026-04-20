import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/fields/adress_form_filed.dart';
import 'package:ensan_app/core/common/fields/name_form_field.dart';
import 'package:ensan_app/core/common/ui_tools/image_with_shimmer.dart';
import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/core/common/widgets/custom_text_form_field.dart';
import 'package:ensan_app/core/common/ui_tools/success_dialog.dart';
import 'package:ensan_app/core/constants/app_assets.dart';
import 'package:ensan_app/core/resource/router/app_routes.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:ensan_app/core/common/fields/phone_field.dart';
import 'package:ensan_app/core/common/widgets/custom_section_title.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SureDonationForm extends StatefulWidget {
  const SureDonationForm({super.key, required this.paymentMethod});
  final String paymentMethod;

  @override
  State<SureDonationForm> createState() => _SureDonationFormState();
}

class _SureDonationFormState extends State<SureDonationForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _accountController = TextEditingController();
  final _accountNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.paymentMethod == 'vodafone_cache')
            Center(child: SmartImageWithShimmer(path: AppAssets.vodafoneCache)),

          if (widget.paymentMethod == 'instapay')
            Center(child: SmartImageWithShimmer(path: AppAssets.instaPay)),

          CustomSectionTitle(title: "الاسم"),

          AppAnimations.fadeIn(
            NameFormField(nameController: _nameController),
            duration: Duration(milliseconds: 400),
            delay: Duration(milliseconds: 150),
          ),

          const Gap(16),

          CustomSectionTitle(title: "العنوان"),

          AppAnimations.fadeIn(
            AddressFormField(addressController: _addressController),
            duration: Duration(milliseconds: 400),
            delay: Duration(milliseconds: 350),
          ),

          const Gap(16),

          CustomSectionTitle(title: "رقم التلفون"),

          AppAnimations.fadeIn(
            PhoneField(
              phoneController: _phoneController,
              onChanged: (value) {},
            ),
            duration: Duration(milliseconds: 400),
            delay: Duration(milliseconds: 450),
          ),

          if (widget.paymentMethod == 'vodafone_cache') ...[
            const Gap(16),

            CustomSectionTitle(title: "معلومات الحساب", heading: true),

            const Gap(8),

            CustomSectionTitle(title: "رقم حساب فودافون كاش"),

            AppAnimations.fadeIn(
              CustomTextFormField(
                hintText: "أدخل رقم الحساب",
                keyboardType: TextInputType.phone,
                controller: _accountController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'رقم حساب فودافون كاش مطلوب';
                  }
                  final cleanNumber = value.replaceAll(
                    RegExp(r'[\s\-\(\)]'),
                    '',
                  );
                  if (!RegExp(r'^\d+$').hasMatch(cleanNumber)) {
                    return 'رقم الحساب يجب أن يحتوي على أرقام فقط';
                  }
                  if (cleanNumber.length < 10) {
                    return 'رقم الحساب قصير جداً';
                  }
                  return null;
                },
              ),
              duration: const Duration(milliseconds: 400),
              delay: const Duration(milliseconds: 550),
            ),
          ] else if (widget.paymentMethod == 'instapay') ...[
            const Gap(16),
            CustomSectionTitle(title: "معلومات الحساب", heading: true),

            const Gap(8),

            CustomSectionTitle(title: "رقم حساب انستاباى"),

            AppAnimations.fadeIn(
              CustomTextFormField(
                hintText: "أدخل رقم الحساب",
                keyboardType: TextInputType.phone,
                controller: _accountController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'رقم حساب انستاباى مطلوب';
                  }
                  final cleanNumber = value.replaceAll(
                    RegExp(r'[\s\-\(\)]'),
                    '',
                  );
                  if (!RegExp(r'^\d+$').hasMatch(cleanNumber)) {
                    return 'رقم الحساب يجب أن يحتوي على أرقام فقط';
                  }
                  if (cleanNumber.length < 10) {
                    return 'رقم الحساب قصير جداً';
                  }
                  return null;
                },
              ),
              duration: const Duration(milliseconds: 400),
              delay: const Duration(milliseconds: 550),
            ),
            const Gap(16),

            CustomSectionTitle(title: "اسم الحساب"),

            AppAnimations.fadeIn(
              CustomTextFormField(
                hintText: "أدخل اسم الحساب",
                controller: _accountNameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'اسم الحساب مطلوب';
                  }
                  if (value.trim().length < 2) {
                    return 'اسم الحساب قصير جداً';
                  }
                  return null;
                },
              ),
              duration: const Duration(milliseconds: 400),
              delay: const Duration(milliseconds: 650),
            ),
          ],

          const Gap(32),
          AppAnimations.fadeInUp(
            CustomButton(
              text: "تسجيل الطلب",
              onTap: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _submitDonation();
                }
              },
            ),
            duration: Duration(milliseconds: 600),
            delay: Duration(milliseconds: 500),
          ),
        ],
      ),
    );
  }

  void _submitDonation() {
    showSuccessDialog(
      context,
      onPrimaryPressed: () {
        context.pop();
        context.goNamed(AppRoutes.home);
      },
      imagePath: AppAssets.successDonate,
      title: 'تمت عملية تسجيل الطلب بنجاح',
      titleTextSTyle: CustomTextStyles.h2Medium,
      childSubtitle: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'شكرًا لتبرعك الكريم',
              style: CustomTextStyles.body14Medium.copyWith(
                color: AppColors.textAndIconSecondary,
              ),
            ),
            TextSpan(
              text: '\nسيتم التواصل معك فى اقرب وقت\n',
              style: CustomTextStyles.body14Regular,
            ),
            TextSpan(
              text: 'بدعمك نستطيع مواصلة رسالتنا ونشر الأمل في قلوب المحتاجين',
              style: CustomTextStyles.body14Regular,
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
