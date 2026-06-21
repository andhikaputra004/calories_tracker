import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.accent,
      surface: AppColors.surface,
    ),
    scaffoldBackgroundColor: AppColors.background,
    textTheme: GoogleFonts.dmSansTextTheme().copyWith(
      displayLarge: GoogleFonts.dmSerifDisplay(
        fontSize: 40,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      ),
      displayMedium: GoogleFonts.dmSerifDisplay(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      ),
      displaySmall: GoogleFonts.dmSans(fontSize: 13),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: GoogleFonts.dmSerifDisplay(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      ),
    ),
    cardTheme: const CardThemeData(
      color: AppColors.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ),
  );
}
