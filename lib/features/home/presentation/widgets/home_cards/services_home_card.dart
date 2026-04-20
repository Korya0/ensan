// ignore_for_file: deprecated_member_use

import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/common/widgets/unified_home_card.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:ensan_app/features/home/data/unified_home_data.dart';
import 'package:ensan_app/features/home/presentation/widgets/common/navigate_cart_button.dart';
import 'package:ensan_app/features/home/presentation/widgets/common/navigate_donation_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ServiceCard extends StatelessWidget {
  final HomeCardItem item;
  const ServiceCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return UnifiedHomeCard(
      imagePath: item.imagePath,
      title: item.title,
      subtitle: item.subtitle,
      actions: Column(
        children: [
          _ServicePrice(price: item.price ?? 0),
          const Gap(16),
          _ServiceActions(),
        ],
      ),
    );
  }
}

// image/title/subtitle provided by UnifiedHomeCard

class _ServicePrice extends StatelessWidget {
  final double price;
  const _ServicePrice({required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(text: 'سعر سهم التبرع', style: CustomTextStyles.body12Regular),
        TextApp(
          text: '$price ج.م',
          style: CustomTextStyles.body18SemiBold.copyWith(
            color: AppColors.textAndIconPrimary,
          ),
        ),
      ],
    );
  }
}

class _ServiceActions extends StatelessWidget {
  const _ServiceActions();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [NavigateCartButton(), NavigateDonationButton()],
    );
  }
}
