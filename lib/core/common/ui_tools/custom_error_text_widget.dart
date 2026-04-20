import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomErrorTextWidget extends StatelessWidget {
  const CustomErrorTextWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppAnimations.shakeX(
      Padding(
        padding: EdgeInsets.only(top: 8),
        child: Text(
          title,
          style: CustomTextStyles.body12Medium.copyWith(color: AppColors.red),
        ),
      ),
    );
  }
}
