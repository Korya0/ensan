import 'package:ensan_app/core/common/ui_tools/image_with_shimmer.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/constants/app_assets.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EmptyNotification extends StatelessWidget {
  const EmptyNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmartImageWithShimmer(
              path: AppAssets.emptyNotifcation,
              assetShimmerDuration: Duration.zero,
            ),
            Gap(16),
            TextApp(
              text: 'لا توجد اشعارات حاليا',
              style: CustomTextStyles.h3Medium,
            ),
          ],
        ),
      ),
    );
  }
}
