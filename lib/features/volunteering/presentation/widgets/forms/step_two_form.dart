import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/ui_tools/custom_error_text_widget.dart';
import 'package:ensan_app/core/common/widgets/custom_text_form_field.dart';
import 'package:ensan_app/core/common/widgets/radio_option.dart';
import 'package:ensan_app/core/common/widgets/next_button_section.dart';
import 'package:ensan_app/core/common/widgets/custom_section_title.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class VolunteerStepTwoForm extends StatefulWidget {
  final VoidCallback onNext;
  final Map<String, dynamic> formData;

  const VolunteerStepTwoForm({
    super.key,
    required this.onNext,
    required this.formData,
  });

  @override
  State<VolunteerStepTwoForm> createState() => _VolunteerStepTwoFormState();
}

class _VolunteerStepTwoFormState extends State<VolunteerStepTwoForm> {
  final _degreeController = TextEditingController();
  final _jobController = TextEditingController();
  final _facultyController = TextEditingController();
  final _universityController = TextEditingController();
  String? selectedStudyStage;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSectionTitle(
            title: 'معلومات الدراسة والعمل',
            heading: true,
          ),
          const Gap(16),

          // Study Stage
          const CustomSectionTitle(title: 'المرحلة الدراسية / المؤهل'),
          Gap(8),
          AppAnimations.fadeIn(
            CustomRadioList(
              onChanged: (value) {
                setState(() => selectedStudyStage = value);
              },
              enableShadow: false,
              options: [
                RadioOption(id: 'student', title: 'طالب'),
                RadioOption(id: 'graduate', title: 'خريج'),
              ],
            ),
            duration: const Duration(milliseconds: 400),
            delay: const Duration(milliseconds: 150),
          ),
          if (selectedStudyStage == null && _shouldShowStudyStageError)
            CustomErrorTextWidget(title: 'يرجى اختيار المرحلة الدراسية'),
          const Gap(16),

          // Faculty
          const CustomSectionTitle(title: 'الكلية'),
          AppAnimations.fadeIn(
            CustomTextFormField(
              controller: _facultyController,
              hintText: 'مثال دار علوم',
              validator: (value) => (value == null || value.trim().isEmpty)
                  ? 'الكلية مطلوبة'
                  : null,
            ),
            duration: const Duration(milliseconds: 400),
            delay: const Duration(milliseconds: 150),
          ),
          const Gap(16),

          // University
          const CustomSectionTitle(title: 'الجامعة'),
          AppAnimations.fadeIn(
            CustomTextFormField(
              controller: _universityController,
              hintText: 'مثال: جامعة',
              validator: (value) => (value == null || value.trim().isEmpty)
                  ? 'الجامعة مطلوبة'
                  : null,
            ),
            duration: const Duration(milliseconds: 400),
            delay: const Duration(milliseconds: 150),
          ),
          const Gap(16),

          // Job (Optional)
          const CustomSectionTitle(title: 'الوظيفة الحالية (ان وجد)'),
          AppAnimations.fadeIn(
            CustomTextFormField(
              controller: _jobController,
              hintText: 'مثال: مبرمج',
            ),
            duration: const Duration(milliseconds: 400),
            delay: const Duration(milliseconds: 150),
          ),
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

  bool _shouldShowStudyStageError = false;

  bool _validateForm() {
    bool isValid = _formKey.currentState?.validate() ?? false;
    if (selectedStudyStage == null) {
      setState(() => _shouldShowStudyStageError = true);
      isValid = false;
    } else {
      setState(() => _shouldShowStudyStageError = false);
    }
    return isValid;
  }

  void _saveFormData() {
    widget.formData['degree'] = _degreeController.text;
    widget.formData['studyStage'] = selectedStudyStage;
    widget.formData['faculty'] = _facultyController.text;
    widget.formData['university'] = _universityController.text;
    widget.formData['job'] = _jobController.text;
  }
}
