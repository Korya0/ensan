import 'package:ensan_app/core/common/widgets/custom_app_bar.dart';
import 'package:ensan_app/core/resource/router/app_routes.dart';
import 'package:ensan_app/features/menu/presentation/widgets/common/custom_tile_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ApplyCaseView extends StatelessWidget {
  const ApplyCaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'التقديم لحالة مستحقة', showArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: CustomTileSection(
            title: 'المشروعات',
            items: [
              CustomTileItem(
                title: 'مشروع زاد الايتام',
                onTap: () => context.pushNamed(AppRoutes.applayZadProject),
              ),
              CustomTileItem(
                title: 'مشروع بُعثاء امل',
                onTap: () => context.pushNamed(AppRoutes.applayZadProject),
              ),
              CustomTileItem(
                title: 'دار الضيافة',
                onTap: () => context.pushNamed(AppRoutes.applayZadProject),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
