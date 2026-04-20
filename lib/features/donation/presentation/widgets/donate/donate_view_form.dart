import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/ui_tools/custom_error_text_widget.dart';
import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/core/constants/app_assets.dart';
import 'package:ensan_app/core/resource/router/app_routes.dart';
import 'package:ensan_app/core/common/widgets/custom_dropdown.dart';
import 'package:ensan_app/core/common/fields/late_your_notes_widget.dart';
import 'package:ensan_app/features/donation/presentation/widgets/donate/price_donate_field.dart';
import 'package:ensan_app/core/common/widgets/radio_option.dart';
import 'package:ensan_app/core/common/widgets/custom_section_title.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class DonateViewForm extends StatefulWidget {
  const DonateViewForm({super.key});

  @override
  State<DonateViewForm> createState() => _DonateViewFormState();
}

class _DonateViewFormState extends State<DonateViewForm> {
  static const List<String> _donationTypesConst = [
    'صدقة جارية',
    'صدقة',
    'زكاة مال',
    'عام',
  ];
  static const List<String> _projectsConst = [
    'مدرار',
    'زاد',
    'دار ضيافة',
    'بٌعثاء الأمل',
    'حملات موسمية',
    'عام',
  ];
  static final List<RadioOption> _paymentOptionsOnce = [
    RadioOption(
      id: 'cash_delivery',
      title: 'التسليم كاش (مندوب المؤسسة)',
      imagePath: AppAssets.cache,
    ),
    RadioOption(
      id: 'instapay',
      title: 'انستاباي',
      imagePath: AppAssets.instaPay,
    ),
    RadioOption(
      id: 'vodafone_cache',
      title: 'فودافون كاش',
      imagePath: AppAssets.vodafoneCache,
    ),
  ];

  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  String? _donationType = 'عام';
  String? _project = 'عام';
  String? _paymentMethod;

  bool _showPaymentError = false;

  @override
  void dispose() {
    _priceController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSectionTitle(title: 'مبلغ التبرع'),

          AppAnimations.fadeIn(
            PriceDonateField(priceController: _priceController),
            duration: Duration(milliseconds: 500),
            delay: Duration(milliseconds: 150),
          ),
          const Gap(16),

          CustomSectionTitle(title: 'نوع التبرع'),

          AppAnimations.fadeIn(
            CustomDropdown(
              value: _donationType,
              items: _donationTypesConst,
              onChanged: (val) {
                setState(() => _donationType = val);
              },
              hintText: 'نوع التبرع',
            ),
            duration: Duration(milliseconds: 500),
            delay: Duration(milliseconds: 250),
          ),
          const Gap(16),

          CustomSectionTitle(title: 'المشروع'),

          AppAnimations.fadeIn(
            CustomDropdown(
              value: _project,
              items: _projectsConst,
              onChanged: (val) {
                setState(() => _project = val);
              },
              hintText: 'المشروع',
            ),
            duration: Duration(milliseconds: 500),
            delay: Duration(milliseconds: 350),
          ),
          const Gap(16),

          CustomSectionTitle(title: 'طرق الدفع'),

          AppAnimations.fadeIn(
            CustomRadioList(
              options: _paymentOptionsOnce,
              selectedValue: _paymentMethod,
              onChanged: (val) {
                setState(() {
                  _paymentMethod = val;
                  _showPaymentError = false;
                });
              },
            ),
            duration: Duration(milliseconds: 500),
            delay: Duration(milliseconds: 450),
          ),
          if (_showPaymentError)
            CustomErrorTextWidget(title: 'من فضلك اختر طريقة دفع'),

          const Gap(16),
          CustomSectionTitle(title: 'ملاحظات'),

          AppAnimations.fadeIn(
            LateYourNotesWidget(controller: _notesController),
            duration: Duration(milliseconds: 500),
            delay: Duration(milliseconds: 550),
          ),
          const Gap(24),

          CustomButton(
            text: 'التالي',
            onTap: () {
              if (_formKey.currentState!.validate()) {
                if (_paymentMethod == null) {
                  setState(() => _showPaymentError = true);
                  return;
                }
                context.pushNamed(
                  AppRoutes.sureDonation,
                  extra: _paymentMethod,
                );
              }
            },
          ),

          const Gap(24),
        ],
      ),
    );
  }
}
