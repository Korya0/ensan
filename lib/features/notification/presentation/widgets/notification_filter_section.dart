import 'package:flutter/material.dart';
import 'package:ensan_app/core/common/widgets/custom_card_background.dart';
import 'package:ensan_app/core/common/widgets/custom_filter_bar.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';

class NotificationFilterSection extends StatelessWidget {
  const NotificationFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomCardBackground(
        color: AppColors.backgroundSecondary,
        width: double.infinity,
        child: CustomFilterBar(
          filters: const ['الكل', 'اخر الاخبار', 'حملات', 'تبرعات'],
          onFilterSelected: (value) {
            debugPrint('Selected Filter: $value');
          },
        ),
      ),
    );
  }
}
