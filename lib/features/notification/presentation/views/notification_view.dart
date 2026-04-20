import 'package:ensan_app/core/common/widgets/custom_app_bar.dart';
import 'package:ensan_app/features/notification/presentation/widgets/notification_filter_list_section.dart';
import 'package:ensan_app/features/notification/presentation/widgets/notification_filter_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'اشعارات'),

      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: Gap(16)),

            // filter section
            SliverToBoxAdapter(child: NotificationFilterSection()),
            SliverToBoxAdapter(child: Gap(16)),

            // resualt section
            SliverToBoxAdapter(child: NotificationFilterListSection()),
          ],
        ),
      ),
    );
  }
}
