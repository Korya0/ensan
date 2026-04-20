// ignore_for_file: deprecated_member_use

import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    this.thickness = 1,
    this.color = AppColors.textAndIconSecondary,
    super.key,
    this.showTitle = true,
    this.title,
  });

  final double thickness;
  final Color color;
  final bool? showTitle;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: thickness,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withOpacity(0.1),
                  AppColors.primary.withOpacity(0.5),
                  AppColors.primary.withOpacity(0.1),
                ],
              ),
            ),
          ),
        ),
        if (showTitle == true)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.backgroundSecondary,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primary.withOpacity(0.3)),
              ),
              child: TextApp(
                text: title ?? 'يمكنك تسجيل الدخول ب',
                color: AppColors.textAndIconSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        Expanded(
          child: Container(
            height: thickness,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withOpacity(0.1),
                  AppColors.primary.withOpacity(0.5),
                  AppColors.primary.withOpacity(0.1),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
