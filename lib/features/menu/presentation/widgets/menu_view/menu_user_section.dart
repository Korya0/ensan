import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:flutter/material.dart';
import 'package:ensan_app/core/common/widgets/custom_card_background.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:gap/gap.dart';

class MenuUserSection extends StatelessWidget {
  const MenuUserSection({super.key, required this.userName, this.onTap});

  final String userName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomCardBackground(
        padding: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: ShapeDecoration(
                      color: AppColors.backgroundSecondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Icon(Icons.person, color: AppColors.primary),
                  ),

                  Gap(16),
                  _ContentMenuUserSection(userName: userName),

                  Gap(16),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 24,
                    color: AppColors.textAndIconPrimary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContentMenuUserSection extends StatelessWidget {
  const _ContentMenuUserSection({required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(text: 'مرحبا بك', style: CustomTextStyles.body13Regular),
        Gap(4),

        Text(userName, style: CustomTextStyles.body16Medium),
      ],
    );
  }
}
