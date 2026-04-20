import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/fields/name_form_field.dart';
import 'package:ensan_app/core/common/widgets/next_button_section.dart';
import 'package:ensan_app/core/common/widgets/custom_section_title.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ZadProjectStepTwoForm extends StatefulWidget {
  final VoidCallback onNext;
  final Map<String, dynamic> formData;

  const ZadProjectStepTwoForm({
    super.key,
    required this.onNext,
    required this.formData,
  });

  @override
  State<ZadProjectStepTwoForm> createState() => _ZadProjectStepTwoFormState();
}

class _ZadProjectStepTwoFormState extends State<ZadProjectStepTwoForm> {
  final _momoNameController = TextEditingController();
  final _dadNameController = TextEditingController();
  final _adressController = TextEditingController();
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
            title: 'بيانات المقدم اليه المستحق',
            heading: true,
          ),

          // Mom Name
          const CustomSectionTitle(title: 'اسم الام'),
          AppAnimations.fadeIn(
            NameFormField(nameController: _momoNameController),
            duration: const Duration(milliseconds: 400),
            delay: const Duration(milliseconds: 150),
          ),
          const Gap(16),
          //Dad Name
          const CustomSectionTitle(title: 'اسم الزوج المتوفي'),
          AppAnimations.fadeIn(
            NameFormField(nameController: _dadNameController),
            duration: const Duration(milliseconds: 400),
            delay: const Duration(milliseconds: 150),
          ),
          const Gap(16),

          //Dad Name
          const CustomSectionTitle(
            title: 'لعنوان (البلد / موقف ايه/ بيتركب ليها ايه )',
          ),
          AppAnimations.fadeIn(
            NameFormField(nameController: _adressController),
            duration: const Duration(milliseconds: 400),
            delay: const Duration(milliseconds: 150),
          ),
          const Gap(16),

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
    widget.formData['mom_name'] = _momoNameController.text.trim();
    widget.formData['dad_name'] = _dadNameController.text.trim();
    widget.formData['adress'] = _dadNameController.text.trim();
  }
}
