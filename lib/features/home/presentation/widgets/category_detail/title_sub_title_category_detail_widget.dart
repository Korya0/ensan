import 'package:ensan_app/core/common/ui_tools/read_more_text.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:ensan_app/features/home/data/unified_home_data.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TitleSubTitleCategoryDetailWidget extends StatelessWidget {
  const TitleSubTitleCategoryDetailWidget({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        TextApp(
          text: category.title,
          style: CustomTextStyles.h3SemiBold.copyWith(
            color: AppColors.textAndIconSecondary,
          ),
        ),
        const Gap(8),
        // subtitle مع ReadMore
        ReadMoreTextApp(
          text: category.subtitle,
          trimLines: 12,
          style: CustomTextStyles.body16Regular.copyWith(
            color: AppColors.textAndIconPrimary.withAlpha(180),
          ),
          linkColor: AppColors.textAndIconPrimary,
        ),
      ],
    );
  }
}
