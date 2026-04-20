import 'package:ensan_app/core/common/widgets/custom_app_bar.dart';
import 'package:ensan_app/features/menu/presentation/widgets/donation_recored/sections/donation_filter_section.dart';
import 'package:ensan_app/features/menu/presentation/widgets/donation_recored/sections/donation_list_section.dart';
import 'package:ensan_app/features/menu/presentation/widgets/donation_recored/sections/donation_stat_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DonationRecordView extends StatelessWidget {
  const DonationRecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showArrow: true, title: 'سجل التبرعات'),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: Gap(16)),

          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: DonationStatSection(
                title1: 'اجمالى المبلغ',
                value1: '2000 جنية',
                title2: 'اجمالى عدد التبرعات',
                value2: '2',
              ),
            ),
          ),

          const SliverToBoxAdapter(child: Gap(16)),

          const SliverToBoxAdapter(child: DonationFilterSection()),

          const SliverToBoxAdapter(child: Gap(16)),

          const SliverToBoxAdapter(child: DonationListSection()),
        ],
      ),
    );
  }
}
