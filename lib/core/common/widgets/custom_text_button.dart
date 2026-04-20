// ignore_for_file: deprecated_member_use

import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'text_app.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.text,
    required this.onTap,
    this.color = AppColors.primary,
    this.fontSize,
    super.key,
  });

  final String text;
  final Function()? onTap;
  final Color color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TextApp(
        text: text,
        type: TextAppType.bodySmall,
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: fontSize ?? 18,
      ),
    );
  }
}
