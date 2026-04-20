import 'package:ensan_app/core/common/ui_tools/image_with_shimmer.dart';
import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/core/common/widgets/custom_card_background.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/constants/app_assets.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String imageUrl;
  final VoidCallback onDetailsTap;
  final VoidCallback? onIconTap;

  const EventCard({
    super.key,
    required this.title,
    required this.date,
    required this.imageUrl,
    required this.onDetailsTap,
    this.onIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
      child: CustomCardBackground(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SmartImageWithShimmer(height: 205, path: AppAssets.homeNewsPngs),
            const SizedBox(height: 8),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextApp(
                  text: title,
                  textAlign: TextAlign.right,
                  style: CustomTextStyles.body16Medium,
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  textAlign: TextAlign.right,
                  style: CustomTextStyles.body14Regular,
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: GestureDetector(
                    onTap: onIconTap,
                    child: CustomCardBackground(
                      borderRadius: 100,
                      color: AppColors.backgroundSecondary,
                      child: const Icon(Icons.share),
                    ),
                  ),
                ),

                Flexible(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CustomButton(
                      width: 160,
                      borderRadius: 8,
                      text: 'قراءة تفاصيل',
                      onTap: onDetailsTap,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(16),
          ],
        ),
      ),
    );
  }
}
