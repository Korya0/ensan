import 'package:ensan_app/core/common/widgets/custom_app_bar.dart';
import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:ensan_app/features/menu/presentation/widgets/profile/common/change_personal_data.dart';
import 'package:ensan_app/features/menu/presentation/widgets/profile/common/delete_account_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showArrow: true, title: 'البيانات الشخصية'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(24),
              //Image
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: ShapeDecoration(
                    color: AppColors.backgroundSecondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Icon(Icons.person, size: 60, color: AppColors.primary),
                ),
              ),
              const Gap(38),
              // change Privete Data
              ChangePersonalData(),

              const Gap(24),
              CustomButton(
                text: 'حذف الحساب',
                backgroundColor: AppColors.red,
                textColor: AppColors.textAndIconThritly,
                onTap: () => showDialog(
                  barrierDismissible: false,

                  context: context,
                  builder: (context) {
                    return DeleteAccountDialog();
                  },
                ),
              ),
              const Gap(24),
            ],
          ),
        ),
      ),
    );
  }
}
