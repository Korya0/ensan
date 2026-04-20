import 'package:ensan_app/core/common/lists/horizontal_list_view.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/features/home/data/unified_home_data.dart';
import 'package:ensan_app/features/home/presentation/widgets/home_cards/services_home_card.dart';
import 'package:flutter/material.dart';

class ServicesHomeSection extends StatelessWidget {
  const ServicesHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Padding(
          padding: EdgeInsets.only(right: 16, top: 10),
          child: TextApp(text: 'خدماتنا', style: CustomTextStyles.h3SemiBold),
        ),

        //List
        _ServicesHomeSection(),
      ],
    );
  }
}

class _ServicesHomeSection extends StatelessWidget {
  const _ServicesHomeSection();

  @override
  Widget build(BuildContext context) {
    final List<HomeCardItem> list = UnifiedHomeData.servicesItems();
    return HorizontalListView(
      items: list,
      height: 420,
      separatorSize: 0,
      itemBuilder: (context, item, index) {
        return Padding(
          padding: EdgeInsets.only(right: 16, top: 8, bottom: 10),
          child: ServiceCard(item: list[index]),
        );
      },
    );
  }
}
