import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';

class PhoneField extends StatefulWidget {
  final TextEditingController phoneController;
  final Function(PhoneNumber) onChanged;

  const PhoneField({
    super.key,
    required this.phoneController,
    required this.onChanged,
  });

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  final PhoneNumber _initialNumber = PhoneNumber(isoCode: 'EG');

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      textFieldController: widget.phoneController,
      initialValue: _initialNumber,
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        useBottomSheetSafeArea: true,
        leadingPadding: 12,
        setSelectorButtonAsPrefixIcon: true,
        trailingSpace: false,
      ),
      spaceBetweenSelectorAndTextField: 12,
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      selectorTextStyle: CustomTextStyles.body14Medium,
      formatInput: true,
      keyboardType: const TextInputType.numberWithOptions(
        signed: false,
        decimal: false,
      ),
      cursorColor: AppColors.primary,
      inputDecoration: InputDecoration(
        hintText: "مثال 01208259386",
        hintStyle: const TextStyle(
          fontSize: 14,
          color: AppColors.borederEnable,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.borederEnable),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.red, width: 1.5),
        ),
      ),
      validator: FormValidators.validatePhone,
      onInputChanged: widget.onChanged,
    );
  }
}
