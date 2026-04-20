import 'package:ensan_app/features/home/presentation/widgets/home_sections/home_app_bar.dart';
import 'package:ensan_app/features/home/presentation/widgets/home_sections/categories_home_section.dart';
import 'package:ensan_app/features/home/presentation/widgets/home_sections/news_home_section.dart';
import 'package:ensan_app/features/home/presentation/widgets/home_sections/seasonal_campaigns_home_section.dart';
import 'package:ensan_app/features/home/presentation/widgets/home_sections/services_home_section.dart';
import 'package:ensan_app/features/home/presentation/widgets/home_sections/share_things_home_section.dart';
import 'package:ensan_app/features/home/presentation/widgets/home_sections/volnterr_home_sections.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      //
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CategoriesHomeSection()),
            //  Categories

            // News
            SliverToBoxAdapter(child: NewsHomeSection()),

            //Services
            SliverToBoxAdapter(child: ServicesHomeSection()),

            // Share things
            SliverToBoxAdapter(child: ShareThingsHomeSection()),

            // Seasonal campaigns
            SliverToBoxAdapter(child: SeasonalCampaignsHomeSection()),

            // volnteeer
            SliverToBoxAdapter(child: VolnterrHomeSections()),
          ],
        ),
      ),
    );
  }
}
