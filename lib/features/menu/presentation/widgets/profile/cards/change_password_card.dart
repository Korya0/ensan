import 'package:ensan_app/core/common/ui_tools/toast_message.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:ensan_app/features/menu/presentation/widgets/profile/common/custom_profile_dialog.dart';
import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/features/auth/presentation/widgets/fields/custom_password_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordCard extends StatelessWidget {
  ChangePasswordCard({super.key});

  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomProfileDialog(
      title: 'يمكنك تغيير كلمة المرور الخاصة بك',
      content: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomPasswordField(controller: _oldPasswordController),
            const SizedBox(height: 16),
            CustomPasswordField(controller: _newPasswordController),
          ],
        ),
      ),
      actions: [
        CustomButton(
          text: 'إعادة تعيين',
          onTap: () {
            if (_formKey.currentState!.validate()) {
              context.pop();
              ToastMessage.success(context, 'تم تغيير كلمة المرور بنجاح');
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
