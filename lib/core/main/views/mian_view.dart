// ignore_for_file: deprecated_member_use

import 'package:ensan_app/core/constants/app_assets.dart';
import 'package:ensan_app/core/resource/router/app_routes.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class MainView extends StatelessWidget {
  final Widget child;
  const MainView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.toString();

    int getIndex() {
      if (currentLocation.startsWith(AppRoutes.home)) return 0;
      if (currentLocation.startsWith(AppRoutes.donation)) return 1;
      if (currentLocation.startsWith(AppRoutes.volunteer)) return 2;
      if (currentLocation.startsWith(AppRoutes.cart)) return 3;
      if (currentLocation.startsWith(AppRoutes.menu)) return 4;
      return 0;
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundPrimary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,

          selectedItemColor: AppColors.textAndIconSecondary,
          unselectedItemColor: AppColors.hintColor.withOpacity(0.7),

          selectedLabelStyle: CustomTextStyles.body12Regular,
          unselectedLabelStyle: CustomTextStyles.body12Regular,

          showUnselectedLabels: true,
          currentIndex: getIndex(),
          onTap: (index) {
            if (getIndex() != index) {
              HapticFeedback.selectionClick();
            }

            switch (index) {
              case 0:
                context.goNamed(AppRoutes.home);
                break;
              case 1:
                context.goNamed(AppRoutes.donation);
                break;
              case 2:
                context.goNamed(AppRoutes.volunteer);
                break;
              case 3:
                context.goNamed(AppRoutes.cart);
                break;
              case 4:
                context.goNamed(AppRoutes.menu);
                break;
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: _buildIconSvg(AppAssets.fHome, 0, getIndex()),
              label: "الرئيسية",
            ),
            BottomNavigationBarItem(
              icon: _buildIconSvg(AppAssets.fWallet, 1, getIndex()),
              label: 'تبرع',
            ),
            BottomNavigationBarItem(
              icon: _buildIconSvg(AppAssets.fVolnteer, 2, getIndex()),
              label: "تطوع",
            ),
            BottomNavigationBarItem(
              icon: _buildIconSvg(AppAssets.fCart, 3, getIndex()),
              label: "السلة",
            ),
            BottomNavigationBarItem(
              icon: _buildIconSvg(AppAssets.fUser, 4, getIndex()),
              label: "قائمة",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconSvg(String icon, int index, int currentIndex) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: SvgPicture.asset(
        icon,
        color: currentIndex == index
            ? AppColors.textAndIconSecondary
            : AppColors.hintColor.withOpacity(0.7),
      ),
    );
  }
}
