// ignore_for_file: deprecated_member_use

import 'package:ensan_app/core/common/ui_tools/image_with_shimmer.dart';
import 'package:ensan_app/core/common/widgets/custom_card_background.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class UnifiedHomeCard extends StatelessWidget {
  const UnifiedHomeCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.actions,
    this.width = 237,
    this.imageHeight = 140,
    this.subTitleMaxLine,
  });

  final String imagePath;
  final String title;
  final String subtitle;
  final Widget actions;
  final double width;
  final double imageHeight;
  final int? subTitleMaxLine;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: CustomCardBackground(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SmartImageWithShimmer(
                  path: imagePath,
                  height: imageHeight,
                  enableZoom: true,
                  fit: BoxFit.fill,
                ),
                Gap(16.h),
                TextApp(
                  text: title,
                  style: CustomTextStyles.h3SemiBold.copyWith(
                    color: AppColors.textAndIconSecondary,
                  ),
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                Gap(8.h),
                TextApp(
                  text: subtitle,
                  style: CustomTextStyles.body14Regular,
                  textAlign: TextAlign.start,
                  maxLines: subTitleMaxLine ?? 3,
                  textOverflow: TextOverflow.ellipsis,
                ),
                Gap(16.h),
              ],
            ),
            actions,
          ],
        ),
      ),
    );
  }
}
