// ignore_for_file: deprecated_member_use

import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'text_app.dart';

class TextButtonLink extends StatelessWidget {
  const TextButtonLink({
    required this.text,
    required this.onTap,
    this.color = AppColors.textAndIconSecondary,
    this.fontSize,
    this.underline = false,
    super.key,
    this.textStyle,
  });

  final String text;
  final VoidCallback onTap;
  final Color color;
  final double? fontSize;
  final bool underline;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.only(bottom: 16, top: 16),
        child: TextApp(
          text: text,

          style:
              textStyle ??
              CustomTextStyles.body16Regular.copyWith(
                color: color,
                fontSize: fontSize,
                decoration: underline
                    ? TextDecoration.underline
                    : TextDecoration.none,
                decorationColor: AppColors.textAndIconSecondary,
              ),
        ),
      ),
    );
  }
}
