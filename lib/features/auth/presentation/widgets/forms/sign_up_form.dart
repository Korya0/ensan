import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/core/resource/router/app_routes.dart';
import 'package:ensan_app/features/auth/presentation/widgets/fields/custom_password_field.dart';
import 'package:ensan_app/features/auth/presentation/widgets/fields/custom_username_field.dart';
import 'package:ensan_app/features/auth/presentation/widgets/fields/email_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      // fake delay
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => isLoading = false);
        context.goNamed(AppRoutes.home);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Username field
          CustomUsernameField(controller: _userNameController),

          Gap(16.h),

          // Email field
          CustomEmailField(controller: _emailController),

          Gap(16.h),

          // Password field
          CustomPasswordField(controller: _passwordController),

          const Gap(32),

          // Sign up button with fake loading
          AppAnimations.bounceIn(
            CustomButton(
              isLoading: isLoading,
              text: 'تسجيل حساب',
              onTap: _handleSignUp,
            ),
            delay: const Duration(milliseconds: 600),
          ),
        ],
      ),
    );
  }
}
