import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/ui_tools/success_dialog.dart';
import 'package:ensan_app/core/common/widgets/custom_app_bar.dart';
import 'package:ensan_app/core/resource/router/app_routes.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:ensan_app/features/menu/presentation/widgets/zad_project/zad_project_step_one_form.dart';
import 'package:ensan_app/core/common/widgets/step_page.dart';
import 'package:ensan_app/features/menu/presentation/widgets/zad_project/zad_project_step_three_form.dart';
import 'package:ensan_app/features/menu/presentation/widgets/zad_project/zad_project_step_two_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ApplyZadProjectView extends StatefulWidget {
  const ApplyZadProjectView({super.key});

  @override
  State<ApplyZadProjectView> createState() => ApplyZadProjectViewState();
}

class ApplyZadProjectViewState extends State<ApplyZadProjectView> {
  final PageController _controller = PageController();
  int currentStep = 0;
  final int totalSteps = 3;

  // Controllers for form data
  final Map<String, dynamic> formData = {};

  PageController get controller => _controller;

  void nextStep() {
    if (currentStep < totalSteps - 1) {
      setState(() => currentStep++);
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _submitApplication();
    }
  }

  void _submitApplication() {
    // Show success dialog
    showSuccessDialog(
      onPrimaryPressed: () {
        context.pop();
        context.goNamed(AppRoutes.home);
      },
      context,
      title: 'تمت تسجيل الطلب بنجاح',
      childSubtitle: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'شكرًا للتعاون معنا',
              style: CustomTextStyles.body14Medium.copyWith(
                color: AppColors.textAndIconSecondary,
              ),
            ),
            TextSpan(
              text: '\nتعاونك معنا، تقدر تساعد في تغيير حياة الكثيرين.',
              style: CustomTextStyles.body14Medium,
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'التقديم فى مشروع زاد (الايتام)',
        showArrow: true,
      ),
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() => currentStep = index);
        },
        children: [
          AppAnimations.fadeInUp(
            StepPage(
              currentStep: currentStep,
              totalSteps: totalSteps,
              onNext: nextStep,
              formData: formData,
              child: ZadProjectStepOneForm(
                onNext: nextStep,
                formData: formData,
              ),
            ),
            duration: const Duration(milliseconds: 600),
          ),
          AppAnimations.fadeInUp(
            StepPage(
              currentStep: currentStep,
              totalSteps: totalSteps,
              onNext: nextStep,
              formData: formData,
              child: ZadProjectStepTwoForm(
                onNext: nextStep,
                formData: formData,
              ),
            ),

            duration: const Duration(milliseconds: 600),
          ),
          AppAnimations.fadeInUp(
            StepPage(
              currentStep: currentStep,
              totalSteps: totalSteps,
              onNext: nextStep,
              formData: formData,
              child: ZadProjectStepThreeForm(
                onNext: nextStep,
                formData: formData,
              ),
            ),
            duration: const Duration(milliseconds: 600),
          ),
        ],
      ),
    );
  }
}
