import 'package:ensan_app/core/common/ui_tools/image_with_shimmer.dart';
import 'package:ensan_app/core/common/widgets/custom_card_background.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/constants/app_assets.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.projectName,
    required this.projectPrice,
  });

  final String projectName;
  final double projectPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: CustomCardBackground(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----- Text Info -----
            Expanded(
              child: _CartCardInfo(
                projectName: projectName,
                projectPrice: projectPrice,
              ),
            ),

            // ----- Image -----
            SmartImageWithShimmer(
              path: AppAssets.homeNewsPngs,
              height: 111,
              width: 160,
            ),
          ],
        ),
      ),
    );
  }
}

class _CartCardInfo extends StatefulWidget {
  const _CartCardInfo({required this.projectName, required this.projectPrice});

  final String projectName;
  final double projectPrice;

  @override
  State<_CartCardInfo> createState() => _CartCardInfoState();
}

class _CartCardInfoState extends State<_CartCardInfo> {
  int quantity = 1;

  void _increase() {
    setState(() {
      quantity++;
    });
  }

  void _decrease() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice = widget.projectPrice * quantity;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(text: widget.projectName, style: CustomTextStyles.body16Medium),
        const Gap(12),
        Row(
          children: [
            TextApp(text: 'المبلغ', style: CustomTextStyles.body16Medium),
            TextApp(
              text: ': ${totalPrice.toStringAsFixed(2)}\$',
              style: CustomTextStyles.body16Medium,
            ),
          ],
        ),
        const Gap(16),
        // ----- Quantity Controls -----
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: _increase,
              icon: const Icon(
                Icons.add_circle_outline,
                color: AppColors.primary,
              ),
            ),
            TextApp(
              text: quantity.toString(),
              style: CustomTextStyles.body16Medium,
            ),
            IconButton(
              onPressed: _decrease,
              icon: const Icon(
                Icons.remove_circle_outline,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
