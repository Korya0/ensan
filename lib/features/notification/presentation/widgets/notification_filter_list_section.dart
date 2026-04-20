import 'package:ensan_app/core/constants/app_assets.dart';
import 'package:ensan_app/features/notification/presentation/widgets/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationFilterListSection extends StatelessWidget {
  const NotificationFilterListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.9999.sh,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: NotificationCard(
              imagePath: AppAssets.homeNewsPngs,
              title: "اتبرع الان فى مشروع زاد تبرعك هيساعد فى كفالة طفل يتيم",
              timeAgo: "من 4 أيام",
            ),
          );
        },
      ),
    );
  }
}
