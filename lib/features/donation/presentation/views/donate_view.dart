import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/constants/app_assets.dart';
import 'package:ensan_app/features/donation/presentation/widgets/donate/donate_view_form.dart';
import 'package:ensan_app/core/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class DonateView extends StatelessWidget {
  const DonateView({super.key, this.projectName});
  final String? projectName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'التبرع',
        showArrow: context.canPop() ? true : false,
      ),
      body: SafeArea(
        child: AppAnimations.fadeInUp(
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                AppAnimations.zoomIn(
                  Image.asset(AppAssets.applogo, height: 145, width: 116),
                  duration: Duration(milliseconds: 500),
                ),
                Gap(16),
                DonateViewForm(),
              ],
            ),
          ),
          duration: Duration(milliseconds: 600),
        ),
      ),
    );
  }
}
