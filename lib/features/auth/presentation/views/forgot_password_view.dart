import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/common/widgets/text_button_link.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:ensan_app/features/auth/presentation/widgets/forms/forgot_pass_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _ForgotPassHeader(),
              Gap(32.h),
              AppAnimations.fadeInUp(
                const ForgotPassForm(),
                delay: const Duration(milliseconds: 200),
              ),

              SizedBox(height: 0.51.sh),
              AppAnimations.fadeIn(
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextApp(
                      text: 'تذكرت كلمه السر ؟',
                      type: TextAppType.bodyLarge,
                      fontSize: 14,
                    ),
                    TextButtonLink(
                      text: 'تسجيل الدخول',
                      onTap: () => context.pop(),
                    ),
                  ],
                ),
                delay: const Duration(milliseconds: 400),
              ),
              Gap(15.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _ForgotPassHeader extends StatelessWidget {
  const _ForgotPassHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(50.h),
        //
        AppAnimations.fadeInRight(
          TextApp(
            text: 'إعادة تعيين كلمة المرور',
            style: CustomTextStyles.h1SemiBold.copyWith(
              color: AppColors.textAndIconSecondary,
            ),
          ),
          delay: const Duration(milliseconds: 100),
        ),
        Gap(8.h),

        AppAnimations.fadeInRight(
          TextApp(
            text: 'رجاءً أدخل بريدك الإلكتروني لإرسال رابط إعادة التعيين',
            style: CustomTextStyles.body14Regular,
          ),
          delay: const Duration(milliseconds: 200),
        ),
      ],
    );
  }
}
