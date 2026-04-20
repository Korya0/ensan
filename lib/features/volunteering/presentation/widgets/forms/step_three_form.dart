import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/ui_tools/custom_error_text_widget.dart';
import 'package:ensan_app/core/common/widgets/custom_text_form_field.dart';
import 'package:ensan_app/core/common/widgets/radio_option.dart';
import 'package:ensan_app/core/common/widgets/next_button_section.dart';
import 'package:ensan_app/core/common/widgets/custom_section_title.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class VolunteerStepThreeForm extends StatefulWidget {
  final VoidCallback onNext;
  final Map<String, dynamic> formData;

  const VolunteerStepThreeForm({
    super.key,
    required this.onNext,
    required this.formData,
  });

  @override
  State<VolunteerStepThreeForm> createState() => _VolunteerStepThreeFormState();
}

class _VolunteerStepThreeFormState extends State<VolunteerStepThreeForm> {
  final _motivationController = TextEditingController();
  final _experienceController = TextEditingController();
  final _skillsController = TextEditingController();
  final _availabilityController = TextEditingController();
  final _commitmentController = TextEditingController();
  String? selectedVolunteerWork;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  void _loadSavedData() {
    _motivationController.text = widget.formData['motivation'] ?? '';
    _experienceController.text = widget.formData['experience'] ?? '';
    _skillsController.text = widget.formData['skills'] ?? '';
    _availabilityController.text = widget.formData['availability'] ?? '';
    _commitmentController.text = widget.formData['commitment'] ?? '';
    selectedVolunteerWork = widget.formData['volunteerWork'];
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSectionTitle(title: 'معلومات التطوع', heading: true),
          const Gap(16),

          // Previous volunteer work
          const CustomSectionTitle(title: 'سبق واشتركت فى اعمال تطوعية'),
          Gap(8),
          AppAnimations.fadeIn(
            CustomRadioList(
              onChanged: (value) =>
                  setState(() => selectedVolunteerWork = value),
              enableShadow: false,
              options: [
                RadioOption(id: 'yes', title: 'نعم'),
                RadioOption(id: 'no', title: 'لا'),
              ],
            ),
            duration: const Duration(milliseconds: 400),
            delay: const Duration(milliseconds: 150),
          ),
          if (selectedVolunteerWork == null && _shouldShowVolunteerWorkError)
            CustomErrorTextWidget(title: 'يرجى اختيار إجابة'),
          const Gap(16),

          const CustomSectionTitle(title: 'لو الإجابة نعم اذكرها'),
          AppAnimations.fadeIn(
            CustomTextFormField(
              controller: _experienceController,
              hintText: 'مثال جمعية انسان',
              maxLines: 3,
            ),
            duration: const Duration(milliseconds: 400),
            delay: const Duration(milliseconds: 150),
          ),
          const Gap(16),

          const CustomSectionTitle(
            title: 'ما المهارات التي تمتلكها وما اهتماماتك؟',
          ),
          AppAnimations.fadeIn(
            CustomTextFormField(
              controller: _skillsController,
              hintText: 'مثال صناعة الكروشية او القراءة',
              maxLines: 3,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'يرجى ذكر مهاراتك واهتماماتك';
                }
                if (value.trim().length < 10) return 'يرجى كتابة تفاصيل أكثر';
                return null;
              },
            ),
            duration: const Duration(milliseconds: 400),
            delay: const Duration(milliseconds: 150),
          ),
          const Gap(16),

          const CustomSectionTitle(
            title: 'هدف التطوع (لما ترغب فى الالتحاق بانسان)',
          ),
          AppAnimations.fadeIn(
            CustomTextFormField(
              controller: _motivationController,
              hintText: 'مثال لمساعده الفقراء والمحتاجين ومد يد العون',
              maxLines: 2,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'يرجى ذكر هدف التطوع';
                }
                if (value.trim().length < 15) {
                  return 'يرجى كتابة تفاصيل أكثر عن هدفك';
                }
                return null;
              },
            ),
            duration: const Duration(milliseconds: 400),
            delay: const Duration(milliseconds: 150),
          ),
          const Gap(16),

          const CustomSectionTitle(title: 'متوقع انسان تضفلك ايه'),
          AppAnimations.fadeIn(
            CustomTextFormField(
              controller: _availabilityController,
              hintText:
                  'مثال تنمى مهارة العطاء واكتسب خبرة فى التعامل مع الناس',
              validator: (value) => (value == null || value.trim().isEmpty)
                  ? 'يرجى ذكر توقعاتك'
                  : null,
            ),
            duration: const Duration(milliseconds: 400),
            delay: const Duration(milliseconds: 150),
          ),
          const Gap(16),

          const CustomSectionTitle(title: 'عدد ساعات التطوع'),
          AppAnimations.fadeIn(
            CustomTextFormField(
              controller: _commitmentController,
              hintText: 'مثال 4 ساعات عمل',
              validator: (value) => (value == null || value.trim().isEmpty)
                  ? 'يرجى ذكر عدد ساعات التطوع'
                  : null,
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
            isLast: true,
          ),
          const Gap(16),
        ],
      ),
    );
  }

  bool _shouldShowVolunteerWorkError = false;

  bool _validateForm() {
    bool isValid = _formKey.currentState?.validate() ?? false;
    if (selectedVolunteerWork == null) {
      setState(() => _shouldShowVolunteerWorkError = true);
      isValid = false;
    } else {
      setState(() => _shouldShowVolunteerWorkError = false);
    }
    return isValid;
  }

  void _saveFormData() {
    widget.formData['motivation'] = _motivationController.text;
    widget.formData['experience'] = _experienceController.text;
    widget.formData['skills'] = _skillsController.text;
    widget.formData['availability'] = _availabilityController.text;
    widget.formData['commitment'] = _commitmentController.text;
    widget.formData['volunteerWork'] = selectedVolunteerWork;
  }
}
