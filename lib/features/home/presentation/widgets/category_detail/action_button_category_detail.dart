import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:ensan_app/features/home/presentation/widgets/common/navigate_cart_button.dart';
import 'package:ensan_app/features/home/presentation/widgets/common/navigate_contact_us_button.dart';
import 'package:ensan_app/features/home/presentation/widgets/common/navigate_donation_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ActionButtonCategoryDetail extends StatelessWidget {
  const ActionButtonCategoryDetail({
    super.key,
    required this.categoryId,
    this.showDonationCartButton = true,
    this.showContactUsButton = true,
    this.enableBorderContactUsButton = true,
    this.child,
    this.cartButtonWidth,
    this.cartButtonHeight,
    this.donationButtonWidth,
    this.donationButtonHeight,
    this.contactButtonWidth,
    this.contactButtonHeight,
    this.spacingBetweenButtons = 16,
    this.rowSpacing = 12,
    this.enableDonationCartButtonPadding = true,
    this.enableContactUsButtonPadding = true,
    this.donationTypeName,
    this.projectName,
  });

  final bool showDonationCartButton;
  final bool showContactUsButton;
  final bool enableBorderContactUsButton;
  final Widget? child;
  final String categoryId;
  final String? donationTypeName;
  final String? projectName;
  final bool enableDonationCartButtonPadding;
  final bool enableContactUsButtonPadding;

  final double? cartButtonWidth;
  final double? cartButtonHeight;
  final double? donationButtonWidth;
  final double? donationButtonHeight;
  final double? contactButtonWidth;
  final double? contactButtonHeight;

  final double spacingBetweenButtons;
  final double rowSpacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showDonationCartButton)
          Padding(
            padding: enableDonationCartButtonPadding
                ? const EdgeInsets.symmetric(horizontal: 16)
                : EdgeInsets.zero,
            child: Row(
              children: [
                _buildCartButton(),
                SizedBox(width: spacingBetweenButtons),
                Expanded(child: _buildDonateButton()),
              ],
            ),
          ),
        Gap(rowSpacing),
        if (showContactUsButton)
          Padding(
            padding: enableContactUsButtonPadding
                ? const EdgeInsets.symmetric(horizontal: 16)
                : EdgeInsets.zero,
            child: _buildContactUsButton(enableBorderContactUsButton),
          ),

        if (child != null) ...[Gap(rowSpacing), child!, Gap(22)],
      ],
    );
  }

  Widget _buildDonateButton() {
    return SizedBox(
      width: donationButtonWidth,
      height: donationButtonHeight,
      child: NavigateDonationButton(
        width: donationButtonWidth,
        height: donationButtonHeight,
        categoryId: categoryId,
        donationTypeName: donationTypeName,
        projectName: projectName,
      ),
    );
  }

  Widget _buildCartButton() {
    return SizedBox(
      width: cartButtonWidth,
      height: cartButtonHeight,
      child: NavigateCartButton(
        width: cartButtonWidth,
        height: cartButtonHeight,
      ),
    );
  }

  Widget _buildContactUsButton(bool enableBoreder) {
    return SizedBox(
      width: contactButtonWidth,
      height: contactButtonHeight,
      child: NavigateContactUsButton(
        enableBoreder: enableBoreder,
        textColor: enableBoreder ? AppColors.primary : null,
        backgroundColor: enableBoreder ? AppColors.backgroundPrimary : null,
        width: contactButtonWidth,
        height: contactButtonHeight,
      ),
    );
  }
}
