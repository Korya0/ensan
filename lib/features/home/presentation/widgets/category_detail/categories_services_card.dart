import 'package:ensan_app/core/common/lists/horizontal_list_view.dart';
import 'package:ensan_app/core/common/widgets/unified_home_card.dart';
import 'package:ensan_app/features/home/data/unified_home_data.dart';
import 'package:flutter/material.dart';
import 'package:ensan_app/features/home/presentation/widgets/category_detail/action_button_category_detail.dart';

class CategoriesServicesSection extends StatelessWidget {
  final String categoryId;

  const CategoriesServicesSection({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final List<HomeCardItem> items = UnifiedHomeData.itemsForCategory(
      categoryId,
    );

    return HorizontalListView(
      items: items,
      height: 450,
      padding: EdgeInsets.only(right: 16),
      itemBuilder: (context, item, index) {
        final service = items[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CategoriesServicesCard(
            imagePath: service.imagePath,
            title: service.title,
            subtitle: service.subtitle,
            categoryId: categoryId,
          ),
        );
      },
    );
  }
}

class CategoriesServicesCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String categoryId;

  const CategoriesServicesCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return UnifiedHomeCard(
      imagePath: imagePath,
      title: title,
      subTitleMaxLine: 4,
      subtitle: subtitle,
      actions: ActionButtonCategoryDetail(
        categoryId: categoryId,
        donationButtonHeight: 48,
        donationButtonWidth: 130,
        cartButtonHeight: 48,
        cartButtonWidth: 60,
        contactButtonHeight: 48,
        contactButtonWidth: double.infinity,
        enableDonationCartButtonPadding: false,
        enableContactUsButtonPadding: false,
      ),
    );
  }
}
