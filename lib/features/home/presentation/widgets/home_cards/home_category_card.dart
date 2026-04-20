import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/widgets/custom_card_background.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeCategoryCard extends StatelessWidget {
  const HomeCategoryCard({
    super.key,
    required this.title,
    required this.onTap,
    required this.svgsPath,
  });

  final String title;
  final void Function() onTap;
  final String svgsPath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CustomCardBackground(
            child: AppAnimations.bounceIn(
              SvgPicture.asset(svgsPath, height: 45, width: 45),

              delay: Duration(milliseconds: 300),
              duration: Duration(seconds: 2),
            ),
          ),
          const Gap(4),
          TextApp(
            text: title,
            style: CustomTextStyles.body14Medium,
            textAlign: TextAlign.center,
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
