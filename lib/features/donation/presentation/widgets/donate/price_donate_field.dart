import 'package:ensan_app/core/common/widgets/custom_text_form_field.dart';
import 'package:ensan_app/core/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceDonateField extends StatelessWidget {
  const PriceDonateField({super.key, required this.priceController});
  final TextEditingController priceController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: priceController,
      hintText: 'مثال 100 جنيه مصري',
      keyboardType: TextInputType.number,
      validator: FormValidators.validatePrice,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly, // أرقام فقط
        FilteringTextInputFormatter.deny(RegExp(r'\s')), // منع المسافات
        LengthLimitingTextInputFormatter(10),
      ],
    );
  }
}
