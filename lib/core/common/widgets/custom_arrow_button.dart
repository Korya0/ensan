import 'package:ensan_app/core/common/widgets/custom_card_background.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomArrowButton extends StatelessWidget {
  const CustomArrowButton({
    super.key,
    this.colorBackground,
    this.disablePadding = false,
    this.iconColor,
    this.size,
  });
  final Color? colorBackground;
  final Color? iconColor;
  final bool? disablePadding;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pop(),
      child: CustomCardBackground(
        enableShadow: false,
        borderRadius: 8,
        padding: disablePadding == true
            ? EdgeInsets.only(left: 2, right: 8, top: 6, bottom: 6)
            : EdgeInsets.zero,
        color: colorBackground ?? AppColors.textAndIconPrimary.withAlpha(50),
        child: Icon(
          Icons.arrow_back_ios,
          color: iconColor ?? AppColors.textAndIconPrimary,
          size: size ?? 18,
        ),
      ),
    );
  }
}
