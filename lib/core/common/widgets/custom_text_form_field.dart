// ignore_for_file: deprecated_member_use

import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.inputFormatters,
    this.filled,
    this.filledColor,
    this.borderColor,
    this.labelText,
    this.maxLines = 1,
    this.minLines,
    this.textAlignVertical,
    this.contentPadding,
    this.expands = false,
    this.autofillHints,
    this.textInputAction,
  });

  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final bool? filled;
  final Color? filledColor;
  final Color? borderColor;
  final int? maxLines;
  final int? minLines;
  final TextAlignVertical? textAlignVertical;
  final EdgeInsetsGeometry? contentPadding;
  final bool expands;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final outlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: borderColor ?? AppColors.borederFoucs,
        width: 1,
      ),
    );

    return TextFormField(
      controller: controller,
      cursorColor: AppColors.hintColor.withAlpha(100),
      cursorErrorColor: AppColors.hintColor.withAlpha(100),
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      minLines: minLines,
      textInputAction: textInputAction,
      expands: expands,
      autofillHints: autofillHints,

      textAlignVertical: textAlignVertical,
      style: CustomTextStyles.body14Regular.copyWith(),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: CustomTextStyles.body14Regular.copyWith(
          color: AppColors.hintColor,
        ),
        labelText: labelText,
        labelStyle: CustomTextStyles.body14Regular.copyWith(
          color: AppColors.hintColor,
        ),
        filled: filled ?? true,
        fillColor: filledColor ?? Colors.white,
        contentPadding:
            contentPadding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: outlineBorder,
        enabledBorder: outlineBorder.copyWith(
          borderSide: BorderSide(color: AppColors.borederEnable, width: 1),
        ),
        focusedBorder: outlineBorder,
        errorBorder: outlineBorder.copyWith(
          borderSide: BorderSide(color: AppColors.borederError, width: 1),
        ),
        focusedErrorBorder: outlineBorder,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        errorStyle: theme.textTheme.bodySmall!.copyWith(
          color: AppColors.borederError,
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      inputFormatters: inputFormatters,
    );
  }
}
