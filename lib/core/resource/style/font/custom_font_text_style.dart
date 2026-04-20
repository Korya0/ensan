import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyles {
  // === Base Style ===
  static TextStyle _base({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    Color color = AppColors.textAndIconPrimary,
    double height = 1.50,
  }) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );
  }

  // === H1 (24) ===
  static TextStyle get h1Regular =>
      _base(fontSize: 24, fontWeight: FontWeight.normal);
  static TextStyle get h1Medium =>
      _base(fontSize: 24, fontWeight: FontWeight.w500);
  static TextStyle get h1SemiBold =>
      _base(fontSize: 24, fontWeight: FontWeight.w600);
  static TextStyle get h1Bold =>
      _base(fontSize: 24, fontWeight: FontWeight.bold);

  // === H2 (22) ===
  static TextStyle get h2Regular =>
      _base(fontSize: 22, fontWeight: FontWeight.normal);
  static TextStyle get h2Medium =>
      _base(fontSize: 22, fontWeight: FontWeight.w500);
  static TextStyle get h2SemiBold =>
      _base(fontSize: 22, fontWeight: FontWeight.w600);
  static TextStyle get h2Bold =>
      _base(fontSize: 22, fontWeight: FontWeight.bold);

  // === H3 (20) ===
  static TextStyle get h3Regular =>
      _base(fontSize: 20, fontWeight: FontWeight.normal);
  static TextStyle get h3Medium =>
      _base(fontSize: 20, fontWeight: FontWeight.w500);
  static TextStyle get h3SemiBold =>
      _base(fontSize: 20, fontWeight: FontWeight.w600);
  static TextStyle get h3Bold =>
      _base(fontSize: 20, fontWeight: FontWeight.bold);

  // === Body 18 ===
  static TextStyle get body18Regular => _base(fontSize: 18);
  static TextStyle get body18Medium =>
      _base(fontSize: 18, fontWeight: FontWeight.w500);
  static TextStyle get body18SemiBold =>
      _base(fontSize: 18, fontWeight: FontWeight.w600);
  static TextStyle get body18Bold =>
      _base(fontSize: 18, fontWeight: FontWeight.bold);

  // === Body 16 ===
  static TextStyle get body16Regular =>
      _base(fontSize: 16, color: AppColors.textAndIconSecondary, height: 1.3);
  static TextStyle get body16Medium =>
      _base(fontSize: 16, fontWeight: FontWeight.w500, height: 1.50);
  static TextStyle get body16SemiBold =>
      _base(fontSize: 16, fontWeight: FontWeight.w600, height: 1.3);
  static TextStyle get body16Bold =>
      _base(fontSize: 16, fontWeight: FontWeight.bold, height: 1.3);

  // === Body 14 ===
  static TextStyle get body14Regular => _base(fontSize: 14);
  static TextStyle get body14Medium =>
      _base(fontSize: 14, fontWeight: FontWeight.w500);
  static TextStyle get body14SemiBold =>
      _base(fontSize: 14, fontWeight: FontWeight.w600);
  static TextStyle get body14Bold =>
      _base(fontSize: 14, fontWeight: FontWeight.bold);

  // === Body 13 ===
  static TextStyle get body13Regular => _base(fontSize: 13);
  static TextStyle get body13Medium =>
      _base(fontSize: 13, fontWeight: FontWeight.w500);
  static TextStyle get body13SemiBold =>
      _base(fontSize: 13, fontWeight: FontWeight.w600);
  static TextStyle get body13Bold =>
      _base(fontSize: 13, fontWeight: FontWeight.bold);

  // === Body 12 ===
  static TextStyle get body12Regular => _base(fontSize: 12);
  static TextStyle get body12Medium =>
      _base(fontSize: 12, fontWeight: FontWeight.w500);
  static TextStyle get body12SemiBold =>
      _base(fontSize: 12, fontWeight: FontWeight.w600);
  static TextStyle get body12Bold =>
      _base(fontSize: 12, fontWeight: FontWeight.bold);

  // Special: 12 with poppins
  static TextStyle get body12PoppinsRegular => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textAndIconPrimary,
  );
}
