import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundPrimary,
      primaryColor: AppColors.primary,
      brightness: Brightness.light,
      iconTheme: const IconThemeData(color: AppColors.textAndIconPrimary),

      textTheme: TextTheme(
        // Using CustomTextStyles for consistency
        displayLarge: CustomTextStyles.h1Regular,
        displayMedium: CustomTextStyles.h1SemiBold,
        displaySmall: CustomTextStyles.h1Medium,
        headlineLarge: CustomTextStyles.h1Bold,

        headlineMedium: CustomTextStyles.h2Regular,
        headlineSmall: CustomTextStyles.h2Medium,

        titleLarge: CustomTextStyles.h3Regular,
        titleMedium: CustomTextStyles.h3Medium,
        titleSmall: CustomTextStyles.h3SemiBold,

        bodyLarge: CustomTextStyles.body18Regular,
        bodyMedium: CustomTextStyles.body16Regular,
        bodySmall: CustomTextStyles.body14Regular,

        labelLarge: CustomTextStyles.body18Medium,
        labelMedium: CustomTextStyles.body18SemiBold,
        labelSmall: CustomTextStyles.body18Bold,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundSecondary,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textAndIconPrimary),
        titleTextStyle: CustomTextStyles.h3Bold,
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
    );
  }
}
