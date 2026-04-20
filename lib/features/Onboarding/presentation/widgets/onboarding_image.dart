import 'package:ensan_app/core/common/ui_tools/image_with_shimmer.dart';
import 'package:flutter/material.dart';

class OnboardingImage extends StatelessWidget {
  final List<dynamic> pages;
  final PageController pageController;
  final Function(int) onPageChanged;

  const OnboardingImage({
    super.key,
    required this.pages,
    required this.pageController,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: pages.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        return SmartImageWithShimmer(
          assetShimmerDuration: Duration.zero,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          path: pages[index].image,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
