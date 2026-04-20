import 'package:ensan_app/core/common/ui_tools/toast_message.dart';
import 'package:ensan_app/core/common/widgets/custom_card_background.dart';
import 'package:ensan_app/core/constants/app_assets.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigateCartButton extends StatelessWidget {
  const NavigateCartButton({super.key, this.height, this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ToastMessage.success(context, 'تم الاضافه بنجاح');
      },
      child: CustomCardBackground(
        height: height,
        width: width ?? 56,
        padding: const EdgeInsets.all(14),
        enableShadow: false,
        color: AppColors.backgroundSecondary,
        child: SvgPicture.asset(AppAssets.cart),
      ),
    );
  }
}
