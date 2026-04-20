import 'package:ensan_app/core/common/ui_tools/toast_message.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:ensan_app/features/menu/presentation/widgets/profile/common/custom_profile_dialog.dart';
import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/features/auth/presentation/widgets/fields/custom_username_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangeNameCard extends StatelessWidget {
  ChangeNameCard({super.key});

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomProfileDialog(
      title: 'تغيير الاسم',
      content: Form(
        key: _formKey,
        child: CustomUsernameField(controller: _nameController),
      ),
      actions: [
        CustomButton(
          text: 'حفظ',
          onTap: () {
            if (_formKey.currentState!.validate()) {
              context.pop();
              ToastMessage.success(context, 'تم تغيير الاسم بنجاح');
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
