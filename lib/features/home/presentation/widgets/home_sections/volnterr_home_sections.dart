// ignore_for_file: deprecated_member_use

import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/core/common/widgets/unified_home_card.dart';
import 'package:ensan_app/core/constants/app_assets.dart';
import 'package:ensan_app/core/resource/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VolnterrHomeSections extends StatelessWidget {
  const VolnterrHomeSections({super.key});

  @override
  Widget build(BuildContext context) {
    return const _VolnterrHomeCard();
  }
}

class _VolnterrHomeCard extends StatelessWidget {
  const _VolnterrHomeCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: UnifiedHomeCard(
        imageHeight: 120,
        imagePath: AppAssets.volnterr,
        title: 'معًا نصنع الأثر',
        subtitle:
            'هناك أيدٍ تنتظر العون، وقلوب تتعطش للأمل... خطوة واحدة منك قد تكون بداية لرحلة تغيير حياة شخصٍ إلى الأبد.',
        actions: const _ServiceActions(),
      ),
    );
  }
}

// image/title/subtitle provided by UnifiedHomeCard

/// الأزرار
class _ServiceActions extends StatelessWidget {
  const _ServiceActions();

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: double.infinity,
      text: 'تواصل معنا',
      onTap: () => context.pushNamed(AppRoutes.cart),
    );
  }
}
