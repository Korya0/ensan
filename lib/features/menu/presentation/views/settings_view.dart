import 'package:ensan_app/core/common/widgets/custom_app_bar.dart';
import 'package:ensan_app/core/common/widgets/toggle_switch_button.dart';
import 'package:ensan_app/features/menu/presentation/widgets/common/custom_tile_section.dart';
import 'package:ensan_app/features/menu/presentation/widgets/settings/language_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _notificationsEnabled = false;
  String _selectedLanguage = "ar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showArrow: true, title: 'الاعدادت'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(16),
              CustomTileSection(
                title: 'معلومات إضافية',
                items: [
                  CustomTileItem(
                    icon: Icons.notifications,
                    title: 'الاشعارات',
                    onTap: () {},
                    child: ToggleSwitchButton(
                      isEnabled: _notificationsEnabled,
                      onChanged: (value) {
                        setState(() => _notificationsEnabled = value);
                        debugPrint(
                          value
                              ? "🔔 Notifications Enabled"
                              : "🔕 Notifications Disabled",
                        );
                      },
                    ),
                  ),
                  CustomTileItem(
                    icon: Icons.language,
                    title: 'لغة التطبيق',
                    onTap: () async {
                      final result = await showModalBottomSheet<String>(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) =>
                            LanguageBottomSheet(selected: _selectedLanguage),
                      );
                      if (result != null) {
                        setState(() => _selectedLanguage = result);
                        debugPrint("🌐 Selected Language: $result");
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
