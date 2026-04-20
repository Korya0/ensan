import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:flutter/material.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';

class CustomProfileDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final List<Widget> actions;

  const CustomProfileDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.backgroundSecondary,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(
          color: const Color(0xFFECF8F2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextApp(text: title, style: CustomTextStyles.h3Bold),
            const SizedBox(height: 24),
            content,
            const SizedBox(height: 32),
            Row(
              children: actions
                  .map(
                    (e) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: e,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
