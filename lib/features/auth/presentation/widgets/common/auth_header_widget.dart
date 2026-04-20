import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/constants/app_assets.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AuthHeaderWidget extends StatelessWidget {
  const AuthHeaderWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.backgroundPrimary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppAnimations.staggered(
              Image.asset(AppAssets.applogo, width: 120.w),
              0,
              baseDelay: const Duration(milliseconds: 100),
              type: 'bounceIn',
            ),
            Gap(6.h),

            // Subtitle with staggered animation
            AppAnimations.staggered(
              TextApp(
                text: 'ابدأ يومك بالخير',
                style: CustomTextStyles.body16Medium,
              ),
              1,
              baseDelay: const Duration(milliseconds: 100),
              type: 'fadeIn',
            ),
            Gap(6.h),

            // Main title with staggered animation
            AppAnimations.staggered(
              TextApp(text: title, style: CustomTextStyles.h3SemiBold),
              2,
              baseDelay: const Duration(milliseconds: 100),
              type: 'fadeIn',
            ),

            Gap(16.h),
          ],
        ),
      ),
    );
  }
}
