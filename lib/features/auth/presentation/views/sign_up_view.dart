import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/ui_tools/app_divider.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/common/widgets/text_button_link.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:ensan_app/features/auth/presentation/widgets/common/auth_body_background.dart';
import 'package:ensan_app/features/auth/presentation/widgets/common/auth_header_widget.dart';
import 'package:ensan_app/features/auth/presentation/widgets/common/social_button.dart';
import 'package:ensan_app/features/auth/presentation/widgets/forms/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const AuthHeaderWidget(title: 'الرجاء ادخال البيانات الخاصة بك'),

            // Body
            AppAnimations.fadeInUp(
              AuthBodyBackground(
                child: Column(
                  children: [
                    const SignUpForm(),

                    Gap(24.h),
                    const AppDivider(),
                    Gap(16.h),

                    AppAnimations.slideInUp(
                      const SocialButton(),
                      delay: const Duration(milliseconds: 100),
                    ),
                    Gap(20.h),

                    AppAnimations.fadeIn(
                      Row(
                        spacing: 5.w,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextApp(
                            text: 'لديك حساب بالفعل ؟',
                            type: TextAppType.bodyLarge,
                            fontSize: 14,
                          ),
                          TextButtonLink(
                            fontSize: 14,
                            text: 'تسجيل الدخول',
                            onTap: () => context.pop(),
                          ),
                        ],
                      ),
                      delay: const Duration(milliseconds: 150),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
