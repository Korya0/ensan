import 'package:ensan_app/core/common/widgets/custom_card_background.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTileCard extends StatelessWidget {
  const CustomTileCard({
    super.key,
    required this.title,
    this.icon,
    this.onTap,
    this.child,
  });

  final String title;
  final IconData? icon;
  final VoidCallback? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: CustomCardBackground(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (icon != null)
              Icon(icon, size: 24, color: AppColors.textAndIconPrimary),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: CustomTextStyles.body16Regular.copyWith(
                  color: AppColors.textAndIconPrimary,
                ),
              ),
            ),
            if (child != null) child!,
            if (child == null)
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: AppColors.textAndIconPrimary,
              ),
          ],
        ),
      ),
    );
  }
}
