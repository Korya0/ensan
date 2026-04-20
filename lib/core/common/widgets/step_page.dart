import 'package:ensan_app/core/constants/app_assets.dart';
import 'package:ensan_app/features/volunteering/presentation/views/volunteer_view.dart';
import 'package:ensan_app/core/common/widgets/step_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StepPage extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final VoidCallback onNext;
  final Map<String, dynamic> formData;
  final Widget child;

  const StepPage({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.onNext,
    required this.formData,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(16),
            Align(
              alignment: Alignment.center,
              child: Image.asset(AppAssets.applogo, height: 131, width: 105),
            ),
            Gap(16),
            StepIndicator(
              currentStep: currentStep,
              totalSteps: totalSteps,
              onStepTap: (index) {
                // Jump or animate to the clicked page
                if (index < currentStep) {
                  (context
                          .findAncestorStateOfType<VolunteerViewState>()
                          ?.controller)
                      ?.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                }
              },
            ),
            Gap(32),
            child,
          ],
        ),
      ),
    );
  }
}
