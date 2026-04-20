import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/constants/app_assets.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';

Future<void> showSuccessDialog(
  BuildContext context, {
  required String title,
  String? subtitle,
  Widget? childSubtitle,
  String? imagePath,
  String primaryButtonText = 'العودة للصفحة الرئيسية',
  VoidCallback? onPrimaryPressed,
  TextStyle? titleTextSTyle,
  TextStyle? subTextSTyle,
}) async {
  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AppAnimations.flipInX(
        Dialog(
          backgroundColor: AppColors.backgroundPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppAnimations.fadeInDown(
                  Image.asset(
                    imagePath ?? AppAssets.successSendLinkToresetPass,
                    height: 150,
                  ),
                ),
                const SizedBox(height: 16),
                AppAnimations.fadeInUp(
                  TextApp(
                    text: title,
                    style: titleTextSTyle ?? CustomTextStyles.h3SemiBold,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 12),
                if (childSubtitle != null)
                  AppAnimations.fadeIn(childSubtitle)
                else if (subtitle != null)
                  AppAnimations.fadeInUp(
                    TextApp(
                      text: subtitle,
                      style: subTextSTyle ?? CustomTextStyles.body18Regular,
                      textAlign: TextAlign.center,
                    ),
                  ),
                const SizedBox(height: 24),
                AppAnimations.slideInUp(
                  CustomButton(
                    text: primaryButtonText,
                    onTap: () {
                      if (onPrimaryPressed != null) {
                        onPrimaryPressed();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
