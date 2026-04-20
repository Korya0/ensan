// ignore_for_file: deprecated_member_use

import 'package:ensan_app/core/common/ui_tools/image_with_shimmer.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeNewsCard extends StatelessWidget {
  final String imagePath;
  final int? indicatorCount;
  final int? indicatorActiveIndex;
  const HomeNewsCard({
    super.key,
    required this.imagePath,
    this.indicatorCount,
    this.indicatorActiveIndex,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SmartImageWithShimmer(
          fit: BoxFit.fill,
          path: imagePath,
          borderRadius: BorderRadius.circular(16),
          width: 0.9.sw,
          height: double.infinity,
          enableZoom: true,
        ),
        if ((indicatorCount ?? 0) > 1 && indicatorActiveIndex != null)
          Positioned(
            left: 0,
            right: 0,
            bottom: 8,
            child: Center(
              child: AnimatedSmoothIndicator(
                activeIndex: indicatorActiveIndex!.clamp(
                  0,
                  (indicatorCount ?? 1) - 1,
                ),
                count: indicatorCount!,
                effect: ExpandingDotsEffect(
                  dotHeight: 6,
                  dotWidth: 10,
                  spacing: 4,
                  expansionFactor: 3,
                  dotColor: AppColors.borederEnable,
                  activeDotColor: AppColors.primary,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
