import 'package:ensan_app/core/resource/router/app_routes.dart';
import 'package:ensan_app/features/menu/presentation/widgets/common/custom_tile_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class MenuSettingSection extends StatelessWidget {
  const MenuSettingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Extra Info
        CustomTileSection(
          title: 'معلومات إضافية',
          items: [
            CustomTileItem(
              title: 'الإعدادات',
              icon: Icons.settings,
              onTap: () => context.pushNamed(AppRoutes.settings),
            ),
            CustomTileItem(
              title: 'أخبار',
              icon: Icons.article_outlined,
              onTap: () => context.pushNamed(AppRoutes.event),
            ),
            CustomTileItem(
              title: 'سجل التبرعات',
              icon: Icons.history,
              onTap: () => context.pushNamed(AppRoutes.donationRecord),
            ),
            CustomTileItem(
              title: 'التقديم لحالة مستحقة',
              icon: Icons.assignment_ind_outlined,
              onTap: () => context.pushNamed(AppRoutes.applyCase),
            ),
          ],
        ),
        const Gap(24),

        // App Info
        CustomTileSection(
          title: 'معلومات التطبيق',
          items: [
            CustomTileItem(
              title: 'تواصل معنا',
              icon: Icons.phone_in_talk,
              onTap: () => debugPrint(" عنا"),
            ),
            CustomTileItem(
              title: 'معلومات عنا',
              icon: Icons.info_outline,
              onTap: () => context.pushNamed(AppRoutes.aboutUs),
            ),
            CustomTileItem(
              title: 'الفروع',
              icon: Icons.location_on_outlined,
              onTap: () => debugPrint("الفروع"),
            ),
          ],
        ),
      ],
    );
  }
}
