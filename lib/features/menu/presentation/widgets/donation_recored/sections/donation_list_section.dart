import 'package:ensan_app/core/constants/app_assets.dart';
import 'package:ensan_app/features/menu/presentation/widgets/donation_recored/donation_record_card.dart';
import 'package:flutter/material.dart';

class DonationListSection extends StatelessWidget {
  const DonationListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          child: DonationRecordCard(
            imagePath: AppAssets.homeNewsPngs,
            title: 'مشروع زاد (كفالة شهرية)',
            date: '20-3-2025',
            amount: '1000 ',
          ),
        );
      },
    );
  }
}
