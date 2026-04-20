// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';

class AuthBodyBackground extends StatelessWidget {
  const AuthBodyBackground({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.backgroundSecondary.withOpacity(0.8),
            AppColors.backgroundSecondary,
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 24),
        child: child,
      ),
    );
  }
}
