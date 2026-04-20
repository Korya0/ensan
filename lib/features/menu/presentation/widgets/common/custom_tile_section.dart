import 'package:ensan_app/core/common/widgets/custom_section_title.dart';
import 'package:ensan_app/features/menu/presentation/widgets/common/custom_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomTileSection extends StatelessWidget {
  const CustomTileSection({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  final List<CustomTileItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSectionTitle(title: title, heading: true),
        const Gap(16),
        ...items.map(
          (item) => Column(
            children: [
              CustomTileCard(
                icon: item.icon,
                title: item.title,
                onTap: item.onTap,
                child: item.child,
              ),
              const Gap(12),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomTileItem {
  final String title;
  final IconData? icon;
  final Widget? child;
  final VoidCallback onTap;

  CustomTileItem({
    required this.title,
    required this.onTap,
    this.icon,
    this.child,
  });
}
