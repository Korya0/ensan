import 'package:ensan_app/core/common/widgets/custom_app_bar.dart';
import 'package:ensan_app/features/menu/presentation/widgets/events/events_card.dart';
import 'package:flutter/material.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    /// بيانات تجريبية
    final events = [
      {
        "title": "نظمنا يومًا ترفيهيًا مميزًا لأطفال مشروع زاد",
        "date": "20-7-2025",
        "imageUrl": "https://placehold.co/327x205",
      },
      {
        "title": "حملة للتبرع بالدم في مستشفى جامعة القاهرة",
        "date": "5-8-2025",
        "imageUrl": "https://placehold.co/327x205",
      },
      {
        "title": "رحلة إلى مكتبة الإسكندرية لطلاب المرحلة الثانوية",
        "date": "12-8-2025",
        "imageUrl": "https://placehold.co/327x205",
      },
    ];

    return Scaffold(
      appBar: CustomAppBar(showArrow: true, title: 'أخبار'),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 16),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return EventCard(
            title: event["title"]!,
            date: event["date"]!,
            imageUrl: event["imageUrl"]!,
            onDetailsTap: () {},
            onIconTap: () {},
          );
        },
      ),
    );
  }
}
