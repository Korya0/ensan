import 'package:ensan_app/features/menu/presentation/widgets/common/custom_tile_card.dart';
import 'package:ensan_app/features/menu/presentation/widgets/profile/cards/change_email.dart';
import 'package:ensan_app/features/menu/presentation/widgets/profile/cards/change_name_card.dart';
import 'package:ensan_app/features/menu/presentation/widgets/profile/cards/change_password_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ChangePersonalData extends StatelessWidget {
  const ChangePersonalData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTileCard(
          title: 'تغيير كلمة المرور',
          icon: Icons.password,
          onTap: () => showDialog(
            context: context,
            builder: (context) => ChangePasswordCard(),
          ),
        ),
        const Gap(16),
        CustomTileCard(
          title: 'تغيير الاسم',
          icon: Icons.person,
          onTap: () => showDialog(
            context: context,
            builder: (context) => ChangeNameCard(),
          ),
        ),
        const Gap(16),
        CustomTileCard(
          title: 'تغيير البريد',
          icon: Icons.email,
          onTap: () => showDialog(
            context: context,
            builder: (context) => ChangeEmailCard(),
          ),
        ),
      ],
    );
  }
}
