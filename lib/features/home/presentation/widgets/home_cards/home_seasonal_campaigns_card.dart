// ignore_for_file: deprecated_member_use

import 'package:ensan_app/core/common/widgets/unified_home_card.dart';
import 'package:ensan_app/features/home/data/unified_home_data.dart';
import 'package:ensan_app/features/home/presentation/widgets/common/navigate_cart_button.dart';
import 'package:ensan_app/features/home/presentation/widgets/common/navigate_donation_button.dart';
import 'package:flutter/material.dart';

class HomeSeasonalCampaignsCard extends StatelessWidget {
  final HomeCardItem item;
  const HomeSeasonalCampaignsCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return UnifiedHomeCard(
      imagePath: item.imagePath,
      title: item.title,
      subtitle: item.subtitle,
      actions: _ServiceActions(),
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
