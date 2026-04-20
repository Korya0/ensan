import 'package:ensan_app/core/common/ui_tools/toast_message.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:ensan_app/features/menu/presentation/widgets/profile/common/custom_profile_dialog.dart';
import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/features/auth/presentation/widgets/fields/email_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangeEmailCard extends StatelessWidget {
  ChangeEmailCard({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomProfileDialog(
      title: 'تغيير البريد الإلكتروني',
      content: Form(
        key: _formKey,
        child: CustomEmailField(controller: _emailController),
      ),
      actions: [
        CustomButton(
          text: 'حفظ',
          onTap: () {
            if (_formKey.currentState!.validate()) {
              context.pop();
              ToastMessage.success(context, 'تم تغيير البريد بنجاح');
            }
          },
        ),
        CustomButton(
          enableBorder: true,
          backgroundColor: AppColors.backgroundPrimary,
          text: 'إلغاء',
          onTap: () => context.pop(),
        ),
      ],
    );
  }
}
