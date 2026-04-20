import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/core/common/ui_tools/success_dialog.dart';
import 'package:ensan_app/features/auth/presentation/widgets/fields/email_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({super.key});

  @override
  State<ForgotPassForm> createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleForgotPass() {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      // fake delay
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => isLoading = false);

        showSuccessDialog(
          onPrimaryPressed: () {
            context.pop();
            context.pop();
          },
          // ignore: use_build_context_synchronously
          context,
          title: 'تحقق من بريدك الإلكتروني',
          subtitle:
              'تحقق من بريدك الإلكتروني، فقد أرسلنا تعليمات استعادة كلمة السر.',
          primaryButtonText: 'موافق',
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomEmailField(
            controller: _emailController,
            textInputAction: TextInputAction.done,
          ),
          const Gap(48),
          AppAnimations.bounceIn(
            CustomButton(
              isLoading: isLoading,
              text: 'ارسل الرابط',
              onTap: _handleForgotPass,
            ),
            delay: const Duration(milliseconds: 400),
          ),
        ],
      ),
    );
  }
}
