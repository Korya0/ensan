import 'package:ensan_app/core/common/widgets/social_media_row.dart';
import 'package:ensan_app/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

class AboutUsSocialButton extends StatelessWidget {
  const AboutUsSocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SocialMediaRow(
      items: const [
        SocialMediaItem(
          platform: "threads",
          icon: AppAssets.threads,
          url: "https://www.threads.net/ensan",
        ),
        SocialMediaItem(
          platform: "twitter",
          icon: AppAssets.x,
          url: "https://twitter.com/ensan",
        ),
        SocialMediaItem(
          platform: "insta",
          icon: AppAssets.insta,
          url: "https://instagram.com/ensan",
        ),
        SocialMediaItem(
          platform: "facebook",
          icon: AppAssets.facebook,
          url: "https://facebook.com/ensan",
        ),
      ],
      onTap: (platform) {
        debugPrint("Clicked on $platform");
      },
    );
  }
}
