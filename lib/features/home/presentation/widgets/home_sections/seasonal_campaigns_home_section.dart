import 'package:ensan_app/core/common/lists/horizontal_list_view.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/features/home/data/unified_home_data.dart';
import 'package:ensan_app/features/home/presentation/widgets/home_cards/home_seasonal_campaigns_card.dart';
import 'package:flutter/material.dart';

class SeasonalCampaignsHomeSection extends StatelessWidget {
  const SeasonalCampaignsHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Padding(
          padding: EdgeInsets.only(right: 16, top: 10),
          child: TextApp(
            text: 'حملات موسمية',
            style: CustomTextStyles.h3SemiBold,
          ),
        ),

        //List
        _SeasonalCampaignsList(),
      ],
    );
  }
}

class _SeasonalCampaignsList extends StatelessWidget {
  const _SeasonalCampaignsList();

  @override
  Widget build(BuildContext context) {
    final List<HomeCardItem> list = UnifiedHomeData.seasonalItems();
    return HorizontalListView(
      items: list,
      height: 380,
      itemBuilder: (context, item, index) {
        return Padding(
          padding: EdgeInsets.only(right: 16, top: 8, bottom: 10),
          child: HomeSeasonalCampaignsCard(item: list[index]),
        );
      },
    );
  }
}
