import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomSectionTitle extends StatelessWidget {
  const CustomSectionTitle({
    super.key,
    required this.title,
    this.heading = false,
    this.gap,
  });
  final String title;
  final bool? heading;
  final double? gap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppAnimations.fadeInRight(
          TextApp(
            text: title,
            style: heading == true
                ? CustomTextStyles.h3SemiBold
                : CustomTextStyles.body16Regular.copyWith(
                    color: AppColors.textAndIconPrimary,
                  ),
          ),
          duration: Duration(milliseconds: 500),
          delay: Duration(milliseconds: 400),
        ),
        Gap(gap ?? 8),
      ],
    );
  }
}
