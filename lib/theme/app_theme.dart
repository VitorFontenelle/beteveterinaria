import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Brand palette — lavanda #9c9ad6 and rosa #de8691 with soft neutrals.
class AppColors {
  static const lavanda = Color(0xFF9C9AD6);
  static const rosa = Color(0xFFDE8691);
  static const lavandaDeep = Color(0xFF7A78B8);
  static const rosaDeep = Color(0xFFC96A78);
  static const cream = Color(0xFFFBF8FC);
  static const surface = Color(0xFFFFFFFF);
  static const softLavanda = Color(0xFFF0EFF8);
  static const softRosa = Color(0xFFF9EEF0);
  static const text = Color(0xFF2A2A35);
  static const textMuted = Color(0xFF5C5C6E);
  static const white = Color(0xFFFFFFFF);
  static const footerBg = Color(0xFF3D3B5C);
}

class AppTheme {
  static ThemeData get light {
    final baseText = GoogleFonts.plusJakartaSansTextTheme(
      ThemeData.light().textTheme,
    ).apply(
      bodyColor: AppColors.text,
      displayColor: AppColors.text,
    );

    final display = GoogleFonts.frauncesTextTheme(baseText);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.cream,
      colorScheme: const ColorScheme.light(
        primary: AppColors.rosa,
        onPrimary: AppColors.white,
        secondary: AppColors.lavanda,
        onSecondary: AppColors.white,
        surface: AppColors.surface,
        onSurface: AppColors.text,
      ),
      textTheme: display.copyWith(
        displayLarge: display.displayLarge?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
          color: AppColors.text,
        ),
        displayMedium: display.displayMedium?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: -0.4,
          color: AppColors.text,
        ),
        headlineLarge: display.headlineLarge?.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.text,
        ),
        headlineMedium: display.headlineMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.text,
        ),
        titleLarge: baseText.titleLarge?.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.text,
        ),
        titleMedium: baseText.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.text,
        ),
        bodyLarge: baseText.bodyLarge?.copyWith(
          height: 1.55,
          color: AppColors.textMuted,
        ),
        bodyMedium: baseText.bodyMedium?.copyWith(
          height: 1.55,
          color: AppColors.textMuted,
        ),
        labelLarge: baseText.labelLarge?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.rosa,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          textStyle: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.lavandaDeep,
          side: const BorderSide(color: AppColors.lavanda, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}

/// Shared brand gradient used on CTAs and atmospheric backgrounds.
LinearGradient get brandGradient => const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [AppColors.lavanda, AppColors.rosa],
    );

LinearGradient get brandGradientSoft => const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFFE8E6F5), Color(0xFFF6E8EB), AppColors.cream],
    );
