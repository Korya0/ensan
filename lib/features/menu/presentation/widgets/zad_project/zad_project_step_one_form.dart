import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/fields/name_form_field.dart';
import 'package:ensan_app/core/common/fields/phone_field.dart';
import 'package:ensan_app/core/common/widgets/custom_text_form_field.dart';
import 'package:ensan_app/core/common/widgets/next_button_section.dart';
import 'package:ensan_app/core/common/widgets/custom_section_title.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ZadProjectStepOneForm extends StatefulWidget {
  final VoidCallback onNext;
  final Map<String, dynamic> formData;

  const ZadProjectStepOneForm({
    super.key,
    required this.onNext,
    required this.formData,
  });

  @override
  State<ZadProjectStepOneForm> createState() => _ZadProjectStepOneFormState();
}

class _ZadProjectStepOneFormState extends State<ZadProjectStepOneForm> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _whoApplayCaseController = TextEditingController();
  final _momoCondtionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Personal Information Header
          const CustomSectionTitle(
            title: 'المعلومات المقدم/الدليل',
            heading: true,
          ),

          // Name
          const CustomSectionTitle(title: 'الاسم'),
          AppAnimations.fadeIn(
            NameFormField(nameController: _nameController),
            duration: const Duration(milliseconds: 400),
            delay: const Duration(milliseconds: 150),
          ),
          const Gap(16),

          // Phone
          const CustomSectionTitle(title: 'رقم التليفون'),
          PhoneField(phoneController: _phoneController, onChanged: (value) {}),
          const Gap(16),

          // Who Applay Case
          const CustomSectionTitle(title: 'مين مقدم الحالة (صفته)'),
          CustomTextFormField(
            controller: _whoApplayCaseController,
            hintText: 'مثال: جار ليه',
          ),
          const Gap(16),

          // Mom Condition
          const CustomSectionTitle(
            title: 'ملاحظات المقدم ( الحالة الاجتماعية للام)',
          ),
          CustomTextFormField(
            controller: _momoCondtionController,
            hintText: 'مثال: حالة اجتماعية ضعيفة جداً',
          ),

          const Gap(16),

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

  bool _validateForm() {
    bool isValid = _formKey.currentState?.validate() ?? false;

    return isValid;
  }

  void _saveFormData() {
    widget.formData['name'] = _nameController.text.trim();
    widget.formData['phone'] = _phoneController.text.trim();
    widget.formData['whoApplaycase'] = _whoApplayCaseController.text.trim();
    widget.formData['momCondtion'] = _momoCondtionController.text.trim();
  }
}
