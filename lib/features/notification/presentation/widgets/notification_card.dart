import 'package:ensan_app/core/common/ui_tools/image_with_shimmer.dart';
import 'package:ensan_app/core/common/widgets/custom_card_background.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String timeAgo;

  const NotificationCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCardBackground(
      shadowos: [
        BoxShadow(
          color: Color(0x14000000),
          blurRadius: 20,
          offset: Offset(0, 0),
          spreadRadius: 0,
        ),
      ],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.body16Medium,
                ),
                const SizedBox(height: 8),
                Text(timeAgo, style: CustomTextStyles.body14Regular),
              ],
            ),
          ),
          const SizedBox(width: 16),
          SmartImageWithShimmer(width: 120, height: 110, path: imagePath),
        ],
      ),
    );
  }
}
