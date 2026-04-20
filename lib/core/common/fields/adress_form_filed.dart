import 'package:ensan_app/core/common/widgets/custom_text_form_field.dart';
import 'package:ensan_app/core/utils/validator.dart';
import 'package:flutter/material.dart';

class AddressFormField extends StatelessWidget {
  const AddressFormField({
    super.key,
    required TextEditingController addressController,
    this.isRequired = true,
  }) : _addressController = addressController;

  final TextEditingController _addressController;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: _addressController,
      hintText: "أدخل العنوان",
      maxLines: 2,
      validator: (value) =>
          FormValidators.validateAddress(value, isRequired: isRequired),
    );
  }
}
