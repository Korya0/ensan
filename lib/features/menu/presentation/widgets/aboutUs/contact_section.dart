import 'package:ensan_app/core/common/widgets/custom_section_title.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  final String branchName;
  final List<String> phones;

  const ContactSection({
    super.key,
    required this.branchName,
    required this.phones,
  });

  Future<void> _callNumber(String number) async {
    final Uri uri = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('Could not launch $number');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSectionTitle(title: branchName),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.call, size: 32, color: AppColors.textAndIconSecondary),
            const Gap(8),
            Wrap(
              spacing: 12,
              children: phones
                  .map(
                    (phone) => GestureDetector(
                      onTap: () => _callNumber(phone),
                      child: TextApp(
                        text: phone,
                        style: CustomTextStyles.body16Medium.copyWith(
                          color: AppColors.textAndIconSecondary,
                          //  decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
        const Gap(16),
      ],
    );
  }
}
