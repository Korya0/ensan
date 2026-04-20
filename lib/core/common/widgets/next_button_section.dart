import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class NextButtonSection extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLast;

  const NextButtonSection({
    super.key,
    required this.onPressed,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppAnimations.fadeInUp(
      CustomButton(text: isLast ? "إرسال" : "التالي", onTap: onPressed),
      duration: const Duration(milliseconds: 500),
      delay: const Duration(milliseconds: 200),
    );
  }
}
