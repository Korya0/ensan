import 'package:ensan_app/core/common/ui_tools/image_with_shimmer.dart';
import 'package:ensan_app/core/common/widgets/custom_arrow_button.dart';
import 'package:flutter/material.dart';

class ImageHeaderWithBack extends StatelessWidget {
  const ImageHeaderWithBack({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
          child: SmartImageWithShimmer(
            path: imagePath,
            height: 270,
            borderRadius: BorderRadius.circular(0),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const Positioned(
          right: 16,
          top: 40,
          child: CustomArrowButton(disablePadding: true),
        ),
      ],
    );
  }
}
