import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/core/resource/router/app_routes.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigateContactUsButton extends StatelessWidget {
  const NavigateContactUsButton({
    super.key,
    this.width,
    this.height,
    this.enableBoreder,
    this.backgroundColor,
    this.textColor,
  });
  final double? width;
  final double? height;
  final bool? enableBoreder;
  final Color? backgroundColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      enableBorder: enableBoreder ?? false,
      backgroundColor: backgroundColor ?? AppColors.primary,
      width: width ?? double.infinity,
      textColor: textColor,
      height: height,
      text: 'تواصل معنا',
      padding: EdgeInsets.all(10),
      onTap: () => context.pushNamed(AppRoutes.servicesDetail),
    );
  }
}
