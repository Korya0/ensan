// ignore_for_file: deprecated_member_use

import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/ui_tools/toast_message.dart';
import 'package:ensan_app/core/common/widgets/custom_card_background.dart';
import 'package:ensan_app/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key});

  void _fakeLogin(BuildContext context) {
    ToastMessage.info(context, 'Comming Soon..', position: ToastPosition.top);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 32,
      children: [
        AppAnimations.staggered(
          GestureDetector(
            onTap: () => _fakeLogin(context),
            child: const _SocialButtonBackground(svgsIcon: AppAssets.facebook),
          ),
          0,
          baseDelay: const Duration(milliseconds: 50),
          type: 'fadeIn',
        ),
        AppAnimations.staggered(
          GestureDetector(
            onTap: () => _fakeLogin(context),
            child: const _SocialButtonBackground(svgsIcon: AppAssets.google),
          ),
          1,
          baseDelay: const Duration(milliseconds: 50),
          type: 'fadeIn',
        ),
      ],
    );
  }
}

class _SocialButtonBackground extends StatelessWidget {
  const _SocialButtonBackground({required this.svgsIcon});
  final String svgsIcon;

  @override
  Widget build(BuildContext context) {
    return CustomCardBackground(
      child: SvgPicture.asset(svgsIcon, height: 28, width: 28),
    );
  }
}
