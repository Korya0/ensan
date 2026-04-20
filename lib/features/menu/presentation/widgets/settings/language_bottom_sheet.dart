import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key, required this.selected});

  final String selected;

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  late String _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selected;
  }

  Widget _buildLanguageButton({required String code, required String label}) {
    final bool isSelected = _selected == code;

    return CustomButton(
      onTap: () {
        setState(() => _selected = code);
        Future.delayed(const Duration(milliseconds: 200), () {
          // ignore: use_build_context_synchronously
          Navigator.pop(context, code);
        });
      },
      width: double.infinity,
      height: 48,
      backgroundColor: isSelected
          ? AppColors.primary
          : AppColors.backgroundSecondary,
      enableBorder: isSelected,
      text: label,
      textColor: isSelected
          ? AppColors.textAndIconThritly
          : AppColors.textAndIconPrimary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 296,
      clipBehavior: Clip.antiAlias,
      decoration: const ShapeDecoration(
        color: AppColors.backgroundSecondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            TextApp(
              text: 'اختيار اللغة',
              textAlign: TextAlign.center,
              style: CustomTextStyles.body16Medium,
            ),
            const SizedBox(height: 24),
            _buildLanguageButton(code: "ar", label: "عربي"),
            const SizedBox(height: 16),
            _buildLanguageButton(code: "en", label: "English"),
          ],
        ),
      ),
    );
  }
}
