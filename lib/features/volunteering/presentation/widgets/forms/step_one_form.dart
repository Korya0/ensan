import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/fields/adress_form_filed.dart';
import 'package:ensan_app/core/common/fields/name_form_field.dart';
import 'package:ensan_app/core/common/ui_tools/custom_error_text_widget.dart';
import 'package:ensan_app/core/common/widgets/custom_text_form_field.dart';
import 'package:ensan_app/core/common/fields/phone_field.dart';
import 'package:ensan_app/core/common/widgets/radio_option.dart';
import 'package:ensan_app/core/common/widgets/next_button_section.dart';
import 'package:ensan_app/core/common/widgets/custom_section_title.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: camel_case_types
class VolunteerStepOneForm extends StatefulWidget {
  final VoidCallback onNext;
  final Map<String, dynamic> formData;

  const VolunteerStepOneForm({
    super.key,
    required this.onNext,
    required this.formData,
  });

  @override
  State<VolunteerStepOneForm> createState() => _VolunteerStepOneFormState();
}

// ignore: camel_case_types
class _VolunteerStepOneFormState extends State<VolunteerStepOneForm> {
  final _nameController = TextEditingController();
  final _permanentAddressController = TextEditingController();
  final _currentAddressController = TextEditingController();
  final _nationalIdController = TextEditingController();
  final _phoneController = TextEditingController();
  String? selectedGender;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Personal Information Header
          const CustomSectionTitle(title: 'المعلومات الشخصية', heading: true),

          // Name
          const CustomSectionTitle(title: 'الاسم'),
          AppAnimations.fadeIn(
            NameFormField(nameController: _nameController),
            duration: const Duration(milliseconds: 400),
            delay: const Duration(milliseconds: 150),
          ),
          const Gap(16),

          // Permanent Address
          const CustomSectionTitle(title: 'العنوان الدائم'),
          AppAnimations.fadeIn(
            AddressFormField(addressController: _permanentAddressController),
            duration: const Duration(milliseconds: 400),
            delay: const Duration(milliseconds: 150),
          ),
          const Gap(16),

          // Current Address (Optional)
          const CustomSectionTitle(title: 'العنوان الحالي " في حاله الطلبة "'),
          AppAnimations.fadeIn(
            AddressFormField(
              addressController: _currentAddressController,
              isRequired: false,
            ),
            duration: const Duration(milliseconds: 400),
            delay: const Duration(milliseconds: 150),
          ),
          const Gap(16),

          // National ID
          const CustomSectionTitle(title: 'الرقم القومي'),
          AppAnimations.fadeIn(
            CustomTextFormField(
              controller: _nationalIdController,
              hintText: 'مثال 293736636272727277',
              keyboardType: TextInputType.number,
              validator: _validateNationalId,
            ),
            duration: const Duration(milliseconds: 400),
            delay: const Duration(milliseconds: 150),
          ),
          const Gap(16),

          // Phone
          const CustomSectionTitle(title: 'رقم التليفون'),
          PhoneField(phoneController: _phoneController, onChanged: (value) {}),
          const Gap(16),

          // Gender
          const CustomSectionTitle(title: 'النوع'),
          Gap(8),
          AppAnimations.fadeIn(
            CustomRadioList(
              //   margin: EdgeInsets.zero,
              //  padding: EdgeInsets.zero,
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
              enableShadow: false,
              options: [
                RadioOption(id: 'male', title: 'ذكر'),
                RadioOption(id: 'female', title: 'أنثي'),
              ],
            ),
            duration: const Duration(milliseconds: 400),
            delay: const Duration(milliseconds: 150),
          ),
          if (selectedGender == null && _shouldShowGenderError)
            CustomErrorTextWidget(title: 'يرجى اختيار النوع'),

          const Gap(24),

          NextButtonSection(
            onPressed: () {
              if (_validateForm()) {
                _saveFormData();
                widget.onNext();
              }
            },
          ),

          const Gap(16),
        ],
      ),
    );
  }

  bool _shouldShowGenderError = false;

  String? _validateNationalId(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'الرقم القومي مطلوب';
    }

    final nationalId = value.trim();
    if (nationalId.length != 14) {
      return 'الرقم القومي يجب أن يكون 14 رقماً';
    }

    if (!RegExp(r'^\d+').hasMatch(nationalId)) {
      return 'الرقم القومي يجب أن يحتوي على أرقام فقط';
    }

    return null;
  }

  bool _validateForm() {
    bool isValid = _formKey.currentState?.validate() ?? false;

    if (selectedGender == null) {
      setState(() => _shouldShowGenderError = true);
      isValid = false;
    } else {
      setState(() => _shouldShowGenderError = false);
    }

    return isValid;
  }

  void _saveFormData() {
    widget.formData['name'] = _nameController.text;
    widget.formData['permanentAddress'] = _permanentAddressController.text;
    widget.formData['currentAddress'] = _currentAddressController.text;
    widget.formData['nationalId'] = _nationalIdController.text;
    widget.formData['phone'] = _phoneController.text;
    widget.formData['gender'] = selectedGender;
  }
}
