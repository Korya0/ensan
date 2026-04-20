import 'package:ensan_app/core/common/lists/custom_carousel.dart';
import 'package:ensan_app/features/home/data/unified_home_data.dart';
import 'package:ensan_app/features/home/presentation/widgets/home_cards/home_news_card.dart';
import 'package:flutter/material.dart';

class NewsHomeSection extends StatefulWidget {
  const NewsHomeSection({super.key});

  @override
  State<NewsHomeSection> createState() => _NewsHomeSectionState();
}

class _NewsHomeSectionState extends State<NewsHomeSection> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final images = UnifiedHomeData.categories.map((c) => c.imagePath).toList();
    return CustomCarousel(
      itemCount: images.length,
      height: 210,
      onPageChanged: (i) => setState(() => _currentIndex = i),
      itemBuilder: (context, index, realIndex) {
        return HomeNewsCard(
          imagePath: images[index],
          indicatorCount: images.length,
          indicatorActiveIndex: _currentIndex,
        );
      },
    );
  }
}
