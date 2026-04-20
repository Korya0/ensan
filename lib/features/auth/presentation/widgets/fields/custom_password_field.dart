import 'package:ensan_app/core/common/widgets/custom_text_form_field.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:ensan_app/core/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    required this.controller,
    this.hintText = 'كلمة المرور',
  });

  final TextEditingController controller;
  final String hintText;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      hintText: widget.hintText,
      obscureText: _isObscured,
      validator: FormValidators.validatePassword,
      prefixIcon: Icon(
        Icons.lock_outline,
        color: AppColors.hintColor,
        size: 24,
      ),
      autofillHints: const [AutofillHints.password],
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        child: Icon(
          _isObscured
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: AppColors.hintColor.withAlpha(150),
          size: 24,
        ),
        onTap: () => setState(() => _isObscured = !_isObscured),
      ),
      inputFormatters: [
        LengthLimitingTextInputFormatter(128), // الحد الأقصى للطول
        FilteringTextInputFormatter.allow(
          RegExp(r'[a-zA-Z0-9!@#$%^&*(),.?":{}|<>_\-]'),
        ), // فقط انجليزي + أرقام + رموز
      ],
    );
  }
}
