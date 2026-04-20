import 'package:ensan_app/core/common/widgets/custom_card_background.dart';
import 'package:ensan_app/core/common/widgets/custom_filter_bar.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DonationFilterSection extends StatelessWidget {
  const DonationFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: CustomCardBackground(
        color: AppColors.backgroundSecondary,
        width: double.infinity,
        child: CustomFilterBar(
          filters: const ['اليوم', 'الاسبوع', 'الشهر', 'الكل'],
          onFilterSelected: (value) {
            debugPrint('Selected Filter: $value');
          },
        ),
      ),
    );
  }
}
