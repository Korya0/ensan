// Custom Email Field
import 'package:ensan_app/core/common/widgets/custom_text_form_field.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:ensan_app/core/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomEmailField extends StatelessWidget {
  const CustomEmailField({
    super.key,
    required this.controller,
    this.hintText = 'البريد الإلكتروني',
    this.textInputAction,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      hintText: hintText,
      prefixIcon: Icon(
        Icons.email_outlined,
        color: AppColors.hintColor,
        size: 24,
      ),
      keyboardType: TextInputType.emailAddress,
      validator: FormValidators.validateEmail,
      autofillHints: const [AutofillHints.email],
      textInputAction: textInputAction ?? TextInputAction.next,
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
        LengthLimitingTextInputFormatter(30),
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._\-+]')),
      ],
    );
  }
}
