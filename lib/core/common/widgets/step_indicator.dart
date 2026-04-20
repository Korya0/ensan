import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final ValueChanged<int> onStepTap;

  const StepIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.onStepTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSteps, (index) {
        final bool isActive = index <= currentStep;

        return Expanded(
          child: GestureDetector(
            onTap: () {
              HapticFeedback.vibrate();
              onStepTap(index);
            },
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive
                        ? AppColors.primary
                        : AppColors.primary.withAlpha(50),
                  ),
                  child: Center(
                    child: TextApp(
                      text: '${index + 1}',
                      color: AppColors.textAndIconThritly,
                      fontSize: 11,
                    ),
                  ),
                ),
                const Gap(6),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: isActive ? 4 : 3,
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.primary
                        : AppColors.primary.withAlpha(50),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
