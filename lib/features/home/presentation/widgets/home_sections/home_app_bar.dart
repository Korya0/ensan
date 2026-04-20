import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/constants/app_assets.dart';
import 'package:ensan_app/core/resource/router/app_routes.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 0.1.sh,
      actions: [
        // Notification Icon
        AppAnimations.swing(
          duration: Duration(seconds: 2),
          GestureDetector(
            onTap: () => context.pushNamed(AppRoutes.notification),
            child: SvgPicture.asset(AppAssets.bellRing, height: 24, width: 24),
          ),
        ),
      ],
      actionsPadding: EdgeInsets.only(left: 16, bottom: 16, top: 8),
      title: Padding(
        padding: EdgeInsets.only(right: 16, bottom: 16),
        child: const _HomeAppBarContent('Mahmoud'),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(0.08.sh);
}

class _HomeAppBarContent extends StatelessWidget {
  const _HomeAppBarContent(this.username);
  final String username;

  @override
  Widget build(BuildContext context) {
    return AppAnimations.fadeInRight(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          TextApp(
            text: 'مرحبا بك $username',
            style: CustomTextStyles.h3SemiBold,
          ),

          // sub title
          TextApp(
            text: 'اهلا بك فى انسان',
            style: CustomTextStyles.body14Regular,
          ),
        ],
      ),
    );
  }
}
