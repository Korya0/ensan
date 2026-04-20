import 'package:ensan_app/core/common/widgets/custom_card_background.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DonationStatSection extends StatelessWidget {
  final String title1;
  final String value1;
  final String title2;
  final String value2;

  const DonationStatSection({
    super.key,
    required this.title1,
    required this.value1,
    required this.title2,
    required this.value2,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCardBackground(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(text: title1, style: CustomTextStyles.body13Regular),
                const Gap(16),
                TextApp(text: value1, style: CustomTextStyles.body16Medium),
              ],
            ),
          ),

          Gap(24),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(text: title2, style: CustomTextStyles.body13Regular),
                const Gap(16),
                TextApp(text: value2, style: CustomTextStyles.body16Medium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
