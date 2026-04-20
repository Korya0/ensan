import 'package:flutter/material.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';

class ToggleSwitchButton extends StatelessWidget {
  const ToggleSwitchButton({
    super.key,
    required this.isEnabled,
    required this.onChanged,
    this.activeThumbColor = AppColors.white,
    this.activeTrackColor = AppColors.primary,
    this.inactiveThumbColor = AppColors.borederFoucs,
    this.inactiveTrackColor = AppColors.backgroundSecondary,
    this.disabledThumbColor = Colors.transparent,
    this.disabledTrackColor = Colors.transparent,
  });

  final bool isEnabled;
  final ValueChanged<bool> onChanged;

  final Color activeThumbColor;
  final Color activeTrackColor;
  final Color inactiveThumbColor;
  final Color inactiveTrackColor;
  final Color disabledThumbColor;
  final Color disabledTrackColor;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isEnabled,
      onChanged: onChanged,
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return disabledThumbColor;
        }
        if (states.contains(WidgetState.selected)) {
          return activeThumbColor;
        }
        return inactiveThumbColor;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return disabledTrackColor;
        }
        if (states.contains(WidgetState.selected)) {
          return activeTrackColor;
        }
        return inactiveTrackColor;
      }),
    );
  }
}
