import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/core/resource/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ensan_app/core/services/donation_context.dart';
import 'package:ensan_app/features/home/data/unified_home_data.dart';

class NavigateDonationButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String? categoryId;
  final String? donationTypeName;
  final String? projectName;

  const NavigateDonationButton({
    super.key,
    this.width,
    this.height,
    this.categoryId,
    this.donationTypeName,
    this.projectName,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: width ?? 150,
      height: height,
      text: 'تبرع',
      padding: EdgeInsets.all(10),
      onTap: () {
        DonationContextService.setContext(
          categoryId: categoryId,
          donationTypeName:
              donationTypeName ??
              CategoryDisplayName.arabicName(categoryId ?? ''),
          projectName: projectName,
        );
        context.goNamed(AppRoutes.donation, extra: categoryId);
      },
    );
  }
}
