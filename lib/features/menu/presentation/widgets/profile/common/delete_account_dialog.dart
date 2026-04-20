import 'package:ensan_app/core/common/ui_tools/toast_message.dart';
import 'package:ensan_app/features/menu/presentation/widgets/profile/common/custom_profile_dialog.dart';
import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomProfileDialog(
      title: 'حذف الحساب',
      content: TextApp(
        text:
            'هل أنت متأكد أنك تريد حذف الحساب؟\n'
            'لن تتمكن من استعادة بياناتك بعد الحذف.',

        textAlign: TextAlign.center,
        style: CustomTextStyles.body18Regular,
      ),
      actions: [
        CustomButton(text: 'إلغاء', onTap: () => context.pop()),
        CustomButton(
          text: 'حذف الحساب',
          backgroundColor: AppColors.red,
          textColor: AppColors.textAndIconThritly,
          onTap: () {
            context.pop();
            ToastMessage.success(context, 'تم حذف الحساب بنجاح');
          },
        ),
      ],
    );
  }
}
