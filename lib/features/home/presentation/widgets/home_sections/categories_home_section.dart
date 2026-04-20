import 'package:ensan_app/core/common/lists/horizontal_list_view.dart';
import 'package:ensan_app/features/home/data/unified_home_data.dart';
import 'package:ensan_app/features/home/presentation/widgets/home_cards/home_category_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ensan_app/core/resource/router/app_routes.dart';

class CategoriesHomeSection extends StatelessWidget {
  const CategoriesHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final list = UnifiedHomeData.categories;
    return HorizontalListView(
      items: list,
      height: 130,
      itemBuilder: (BuildContext context, item, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 16, right: 16),
          child: HomeCategoryCard(
            svgsPath: list[index].iconPath,
            title: list[index].title,
            onTap: () {
              context.pushNamed(AppRoutes.categoryDetail, extra: list[index]);
            },
          ),
        );
      },
    );
  }
}
