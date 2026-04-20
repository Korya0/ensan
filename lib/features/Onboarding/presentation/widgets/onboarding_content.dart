import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingContent extends StatelessWidget {
  final int currentIndex;
  final int pagesLength;
  final PageController pageController;
  final String title;
  final String description;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final bool isNavigating;

  const OnboardingContent({
    super.key,
    required this.currentIndex,
    required this.pagesLength,
    required this.pageController,
    required this.title,
    required this.description,
    required this.onNext,
    required this.onPrevious,
    this.isNavigating = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),

            /// Title
            TextApp(
              text: title,
              style: CustomTextStyles.h1SemiBold,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 12),

            /// Description
            TextApp(
              text: description,
              textAlign: TextAlign.center,
              style: CustomTextStyles.body16Medium,
            ),

            SizedBox(height: 20),
          ],
        ),
        Column(
          children: [
            /// Page indicator
            SmoothPageIndicator(
              controller: pageController,
              count: pagesLength,
              effect: JumpingDotEffect(
                dotHeight: 8,
                dotWidth: 20,
                spacing: 16,
                activeDotColor: AppColors.primary,
                dotColor: AppColors.backgroundPrimary,
              ),
              onDotClicked: (index) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
            SizedBox(height: 38),

            /// Navigation buttons
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Row(
                children: [
                  Expanded(
                    child: AppAnimations.bounceInUp(
                      CustomButton(
                        text: currentIndex == pagesLength - 1
                            ? 'البدء'
                            : 'التالي',
                        onTap: isNavigating ? null : onNext,
                      ),
                      delay: Duration(milliseconds: 300),
                    ),
                  ),
                  if (currentIndex > 0) ...[
                    SizedBox(width: 24.w),

                    Expanded(
                      child: AppAnimations.bounceInLeft(
                        CustomButton(
                          text: 'السابق',
                          onTap: isNavigating ? null : onPrevious,
                          enableBorder: true,
                          backgroundColor: AppColors.backgroundPrimary,
                          textColor: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
