import 'package:ensan_app/core/constants/app_assets.dart';
import 'package:ensan_app/features/home/presentation/widgets/category_detail/imag_header_with_back.dart';
import 'package:ensan_app/features/menu/presentation/widgets/aboutUs/about_us_body.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // header
            ImageHeaderWithBack(imagePath: AppAssets.homeNewsPngs),
            Gap(16),
            // body
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AboutUsBody(),
            ),
          ],
        ),
      ),
    );
  }
}
