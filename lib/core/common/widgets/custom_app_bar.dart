import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/widgets/custom_arrow_button.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.showArrow = false, required this.title});
  final bool? showArrow;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundPrimary,
      leading: showArrow == true
          ? AppAnimations.fadeInLeft(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomArrowButton(
                  size: 24,
                  disablePadding: true,
                  iconColor: AppColors.textAndIconPrimary,
                  colorBackground: Colors.transparent,
                ),
              ),
              duration: Duration(milliseconds: 400),
            )
          : null,
      title: AppAnimations.fadeIn(
        TextApp(text: title, style: CustomTextStyles.h2SemiBold),
        duration: Duration(milliseconds: 500),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
