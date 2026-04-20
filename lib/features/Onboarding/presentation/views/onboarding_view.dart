import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/services/shared_pref/pref_keys.dart';
import 'package:ensan_app/core/services/shared_pref/shared_pref.dart';
import 'package:ensan_app/features/Onboarding/data/data/onboarding_data.dart';
import 'package:ensan_app/features/Onboarding/presentation/widgets/onboarding_content.dart';
import 'package:ensan_app/features/Onboarding/presentation/widgets/onboarding_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ensan_app/core/common/widgets/custom_text_button.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:ensan_app/core/resource/router/app_routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  bool _isNavigating = false;

  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
  }

  Future<void> _nextPage() async {
    if (_currentIndex < OnboardingData.onboardingPages.length - 1) {
      await _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      await _goToLogin();
    }
  }

  Future<void> _previousPage() async {
    if (_currentIndex > 0) {
      await _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _goToLogin() async {
    if (_isNavigating) return;

    setState(() => _isNavigating = true);

    try {
      if (mounted) {
        context.goNamed(AppRoutes.login);
        SharedPref.setBool(PrefKeys.showOnboarding, true);
      }
    } finally {
      if (mounted) {
        setState(() => _isNavigating = false);
      }
    }
  }

  Future<void> _skip() async => _goToLogin();

  @override
  Widget build(BuildContext context) {
    final pages = OnboardingData.onboardingPages;

    if (pages.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final safeIndex = _currentIndex.clamp(0, pages.length - 1);

    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.63,
                child: OnboardingImage(
                  pages: pages,
                  pageController: _pageController,
                  onPageChanged: _onPageChanged,
                ),
              ),
              if (_currentIndex < OnboardingData.onboardingPages.length - 1)
                Positioned(
                  top: 60.h,
                  right: 24.w,
                  child: AppAnimations.bounceInDown(
                    CustomTextButton(
                      text: 'تخطي',
                      onTap: _skip,
                      color: AppColors.white,
                    ),
                    delay: Duration(milliseconds: 100),
                  ),
                ),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: OnboardingContent(
                currentIndex: safeIndex,
                pagesLength: pages.length,
                pageController: _pageController,
                title: pages[safeIndex].title,
                description: pages[safeIndex].description,
                onNext: _nextPage,
                onPrevious: _previousPage,
                isNavigating: _isNavigating,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
