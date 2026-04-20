// ignore_for_file: deprecated_member_use

import 'package:ensan_app/core/common/widgets/unified_home_card.dart';
import 'package:ensan_app/features/home/data/unified_home_data.dart';
import 'package:ensan_app/features/home/presentation/widgets/common/navigate_contact_us_button.dart';
import 'package:flutter/material.dart';
// removed unused screenutil import

class ShareThingsHomeCard extends StatelessWidget {
  final HomeCardItem item;
  const ShareThingsHomeCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return UnifiedHomeCard(
      imagePath: item.imagePath,
      title: item.title,
      subtitle: item.subtitle,
      actions: const _ServiceActions(),
    );
  }
}

class _ServiceActions extends StatelessWidget {
  const _ServiceActions();

  @override
  Widget build(BuildContext context) {
    return const NavigateContactUsButton();
  }
}
