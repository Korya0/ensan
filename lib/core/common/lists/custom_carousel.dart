import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarousel extends StatelessWidget {
  final Duration autoScrollDuration;
  final Widget Function(BuildContext, int, int)? itemBuilder;
  final int itemCount;
  final double? height;
  final ValueChanged<int>? onPageChanged;

  const CustomCarousel({
    super.key,
    this.autoScrollDuration = const Duration(seconds: 3),
    required this.itemBuilder,
    required this.itemCount,
    this.height,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      options: CarouselOptions(
        height: height ?? 0.2.sh,
        autoPlay: true,
        autoPlayInterval: autoScrollDuration,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 16 / 9,
        onPageChanged: (index, reason) => onPageChanged?.call(index),
      ),
    );
  }
}
