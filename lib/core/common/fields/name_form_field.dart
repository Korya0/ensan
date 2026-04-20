import 'package:ensan_app/core/common/widgets/custom_text_form_field.dart';
import 'package:ensan_app/core/utils/validator.dart';
import 'package:flutter/material.dart';

class NameFormField extends StatelessWidget {
  const NameFormField({
    super.key,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: _nameController,
      hintText: "أدخل الاسم",
      validator: FormValidators.validateName,
    );
  }
}
