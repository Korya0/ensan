import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/core/common/widgets/text_button_link.dart';
import 'package:ensan_app/core/resource/router/app_routes.dart';
import 'package:ensan_app/features/auth/presentation/widgets/fields/custom_password_field.dart';
import 'package:ensan_app/features/auth/presentation/widgets/fields/email_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      await Future.delayed(const Duration(seconds: 2));

      setState(() => isLoading = false);

      if (mounted) {
        context.goNamed(AppRoutes.home);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Email field
          AppAnimations.fadeInRight(
            CustomEmailField(controller: _emailController),
            delay: const Duration(milliseconds: 200),
          ),
          const Gap(16),

          // Password field
          AppAnimations.fadeInRight(
            CustomPasswordField(controller: _passwordController),
            delay: const Duration(milliseconds: 400),
          ),
          const Gap(8),

          // Forgot password link
          AppAnimations.fadeIn(
            Align(
              alignment: Alignment.centerLeft,
              child: TextButtonLink(
                text: 'نسيت كلمة المرور ؟',
                onTap: () => context.pushNamed(AppRoutes.forgotPass),
              ),
            ),
            delay: const Duration(milliseconds: 600),
          ),
          const Gap(32),

          // Login button
          AppAnimations.bounceIn(
            CustomButton(
              isLoading: isLoading,
              text: 'تسجيل الدخول',
              onTap: _handleLogin,
            ),
            delay: const Duration(milliseconds: 800),
          ),
        ],
      ),
    );
  }
}
