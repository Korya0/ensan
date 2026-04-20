import 'package:ensan_app/core/common/widgets/custom_text_form_field.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:ensan_app/core/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomUsernameField extends StatelessWidget {
  const CustomUsernameField({
    super.key,
    required this.controller,
    this.hintText = 'الاسم',
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      hintText: hintText,
      prefixIcon: Icon(Icons.group, color: AppColors.hintColor, size: 24),
      keyboardType: TextInputType.name,
      validator: FormValidators.validateUsername,
      autofillHints: const [AutofillHints.name],
      textInputAction: TextInputAction.next,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z ]')),
        LengthLimitingTextInputFormatter(30),
      ],
    );
  }
}
