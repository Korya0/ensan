// ignore_for_file: deprecated_member_use

import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCardBackground extends StatelessWidget {
  const CustomCardBackground({
    super.key,
    this.height,
    this.width,
    this.padding,
    required this.child,
    this.color,
    this.enableShadow = true,
    this.borderRadius,
    this.shadowos,
    this.enableboreder,
    this.customBorderRadius,
  });
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  final Color? color;
  final bool? enableShadow;
  final double? borderRadius;
  final List<BoxShadow>? shadowos;
  final bool? enableboreder;
  final BorderRadiusGeometry? customBorderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height,
      padding: padding ?? EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: color ?? AppColors.backgroundPrimary,
        borderRadius:
            customBorderRadius ?? BorderRadius.circular(borderRadius ?? 12),
        boxShadow: enableShadow == true
            ? shadowos ??
                  [
                    BoxShadow(
                      color: Color(0x0C000000),
                      blurRadius: 20,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    ),
                  ]
            : null,
        border: enableboreder == true
            ? Border.all(color: AppColors.borederEnable)
            : null,
      ),

      child: child,
    );
  }
}
