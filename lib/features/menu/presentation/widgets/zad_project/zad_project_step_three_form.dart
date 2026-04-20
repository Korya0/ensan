import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/widgets/custom_text_form_field.dart';
import 'package:ensan_app/core/common/widgets/next_button_section.dart';
import 'package:ensan_app/core/common/widgets/custom_section_title.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ZadProjectStepThreeForm extends StatefulWidget {
  final VoidCallback onNext;
  final Map<String, dynamic> formData;

  const ZadProjectStepThreeForm({
    super.key,
    required this.onNext,
    required this.formData,
  });

  @override
  State<ZadProjectStepThreeForm> createState() =>
      _ZadProjectStepThreeFormState();
}

class _ZadProjectStepThreeFormState extends State<ZadProjectStepThreeForm> {
  final _infoCaseController = TextEditingController();
  final _salaryController = TextEditingController();

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
            title: 'معلومات المتوفى والاولاد',
            heading: true,
          ),

          // Mom Name
          const CustomSectionTitle(
            title: 'متوفى من امتى / كان شغال ايه / سبب الوفاة',
          ),
          AppAnimations.fadeIn(
            CustomTextFormField(
              controller: _infoCaseController,
              hintText: 'مثال متوفى من سنة كان يعمل عامل فى مصنع توفى بالقلب',
              maxLines: 3,
            ),
            duration: const Duration(milliseconds: 400),
            delay: const Duration(milliseconds: 150),
          ),
          const Gap(16),
          // Mom Name
          const CustomSectionTitle(
            title: 'بتقبض معاش تكافل / تامين / مساعدات جمعيات / اهالى',
          ),
          AppAnimations.fadeIn(
            CustomTextFormField(
              controller: _salaryController,
              hintText: 'مثال معاش تكافل من الدولة',
              maxLines: 1,
            ),
            duration: const Duration(milliseconds: 400),
            delay: const Duration(milliseconds: 150),
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
    widget.formData['infoCase'] = _infoCaseController.text.trim();
    widget.formData['salary'] = _salaryController.text.trim();
  }
}
