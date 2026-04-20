import 'package:ensan_app/core/common/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LateYourNotesWidget extends StatelessWidget {
  final TextEditingController controller;

  const LateYourNotesWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      hintText: 'اترك ملاحظاتك',
      validator: null,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      minLines: 6,
      textAlignVertical: TextAlignVertical.top,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }
}
