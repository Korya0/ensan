import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/core/resource/router/app_routes.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:ensan_app/features/menu/presentation/widgets/menu_view/menu_setting_section.dart';
import 'package:ensan_app/features/menu/presentation/widgets/menu_view/menu_user_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

// ============= Main MenuView =============
class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(child: _MenuViewBody()),
      ),
    );
  }
}

class _MenuViewBody extends StatelessWidget {
  const _MenuViewBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile User Card
        const Gap(42),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: MenuUserSection(
            userName: "هاجر لطفى",
            onTap: () => context.pushNamed(AppRoutes.profile),
          ),
        ),

        const Gap(16),

        // Settings Wrapper
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: const MenuSettingSection(),
        ),
        const Gap(16),

        // Logout Button
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomButton(
            text: 'تسجيل الخروج',
            backgroundColor: AppColors.red,
            textColor: AppColors.textAndIconThritly,
          ),
        ),
        const Gap(24),
      ],
    );
  }
}
