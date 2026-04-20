import 'package:ensan_app/core/common/ui_tools/image_with_shimmer.dart';
import 'package:ensan_app/core/common/widgets/custom_card_background.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:flutter/material.dart';

class DonationRecordCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String date;
  final String amount;

  const DonationRecordCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCardBackground(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextApp(text: title, style: CustomTextStyles.body16Medium),
                    const SizedBox(height: 16),
                    TextApp(
                      text: date,
                      style: CustomTextStyles.body14Regular.copyWith(
                        color: const Color(0xFF4D4D4D),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextApp(
                      text: amount,
                      style: CustomTextStyles.body16SemiBold,
                    ),
                    const SizedBox(width: 4),
                    TextApp(
                      text: 'جنية مصري',
                      style: CustomTextStyles.body12SemiBold.copyWith(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          SmartImageWithShimmer(width: 126, height: 111, path: imagePath),
        ],
      ),
    );
  }
}
