import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/core/common/widgets/custom_card_background.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CartSummaryCard extends StatelessWidget {
  const CartSummaryCard({
    super.key,
    required this.totalProjects,
    required this.totalAmount,
  });

  final int totalProjects;
  final String totalAmount;

  @override
  Widget build(BuildContext context) {
    return CustomCardBackground(
      customBorderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      color: AppColors.backgroundSecondary,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _SummaryRow(
            label: 'اجمالي المشاريع المتبرع لها',
            value: totalProjects.toString(),
          ),
          const SizedBox(height: 12),
          _SummaryRow(label: 'اجمالي المبلغ المتبرع به', value: totalAmount),
          const SizedBox(height: 31),
          CustomButton(
            text: 'تبرع',
            backgroundColor: const Color(0xFF4BBE85),
            textColor: const Color(0xFF0D0D0D),
          ),
        ],
      ),
    );
  }
}

/// ---------------------- Reusable Widgets ----------------------

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: label,
          style: CustomTextStyles.body14Regular.copyWith(
            color: Color(0xFF666666),
          ),
        ),
        TextApp(text: value, style: CustomTextStyles.body16Medium),
      ],
    );
  }
}
