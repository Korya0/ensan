import 'package:ensan_app/core/common/lists/horizontal_list_view.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/features/home/data/unified_home_data.dart';
import 'package:ensan_app/features/home/presentation/widgets/home_cards/share_things_home_card.dart';
import 'package:flutter/material.dart';

class ShareThingsHomeSection extends StatelessWidget {
  const ShareThingsHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Padding(
          padding: EdgeInsets.only(right: 16, top: 10),
          child: TextApp(
            text: 'شارك بما لا تحتاجه',
            style: CustomTextStyles.h3SemiBold,
          ),
        ),

        //List
        const _ShareTHingsHomeSection(),
      ],
    );
  }
}

class _ShareTHingsHomeSection extends StatelessWidget {
  const _ShareTHingsHomeSection();

  @override
  Widget build(BuildContext context) {
    final List<HomeCardItem> list = UnifiedHomeData.shareThingsItems();
    return HorizontalListView(
      items: list,
      height: 380,
      itemBuilder: (context, item, index) {
        return Padding(
          padding: EdgeInsets.only(right: 16, top: 8, bottom: 10),
          child: ShareThingsHomeCard(item: list[index]),
        );
      },
    );
  }
}
