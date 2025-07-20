import 'package:flutter/material.dart';

/// Defines the complete, detailed color palette for the application.
/// This palette is structured by color type and usage context (light/dark mode).
abstract final class AppColors {
  // --- BRAND & ACTION COLORS ---
  /// The main, confident blue for primary actions (e.g., "BUY" button) and branding.
  /// Also used for the onboard screen background.
  static const Color brandBlue = Color(0xFF2962FF);

  /// A very light blue for secondary button backgrounds (e.g., "Withdraw" button).
  static const Color actionBlueSecondary = Color(0xFFE8EAF6);

  /// A very light gray-blue for tertiary button backgrounds (e.g., "FX Buy/Sell").
  static const Color actionBlueTertiary = Color(0xFFF0F2F5);

  // --- SEMANTIC COLORS (for meaning) ---
  /// The color for positive financial values and success states. Used for profit and positive charts.
  static const Color success = Color(0xFF388E3C); // A clear, accessible green.

  /// The primary red for important "danger" or "sell" actions (e.g., text on the "SELL" button).
  static const Color dangerPrimary = Color(0xFFD32F2F);

  /// A very light, secondary red for backgrounds of danger-related buttons.
  static const Color dangerSecondary = Color(0xFFFFEBEE);

  // --- NEUTRALS for LIGHT THEME ---
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color surfaceLight = Color(0xFFF7F8FA); // For cards, tags, etc.
  static const Color textDark = Color(
    0xFF0D1117,
  ); // For primary text on light backgrounds
  static const Color textGray = Color(
    0xFF64748B,
  ); // For secondary text on light backgrounds

  // --- NEUTRALS for DARK THEME ---
  static const Color backgroundDark = Color(
    0xFF1A1C1E,
  ); // A dark charcoal, not pure black
  static const Color surfaceDark = Color(
    0xFF25282B,
  ); // A slightly lighter gray for cards
  static const Color textLight = Color(
    0xFFF1F5F9,
  ); // An off-white for primary text on dark backgrounds
  static const Color textLightGray = Color(
    0xFF94A3B8,
  ); // For secondary text on dark backgrounds
}

/// Defines the ThemeData for the application, mapping the color palette to Flutter's theme properties.
abstract final class AppTheme {
  // --- LIGHT THEME ---
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundLight,

    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.brandBlue,
      onPrimary: Colors.white,
      secondary: AppColors.actionBlueSecondary,
      onSecondary: AppColors.brandBlue,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.textDark,
      error: AppColors.dangerPrimary,
      onError: Colors.white,
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.textDark,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      headlineSmall: TextStyle(
        color: AppColors.textDark,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      titleMedium: TextStyle(
        color: AppColors.textDark,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(color: AppColors.textGray, fontSize: 14),
      labelLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),

    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.backgroundLight,
      foregroundColor: AppColors.textDark,
      titleTextStyle: TextStyle(
        color: AppColors.textDark,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  // --- DARK THEME ---
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,

    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.brandBlue,
      onPrimary: Colors.white,
      secondary: AppColors.surfaceDark,
      onSecondary: AppColors.textLight,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.textLight,
      error: AppColors.dangerPrimary,
      onError: Colors.white,
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.textLight,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      headlineSmall: TextStyle(
        color: AppColors.textLight,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      titleMedium: TextStyle(
        color: AppColors.textLight,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(color: AppColors.textLightGray, fontSize: 14),
      labelLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),

    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.backgroundDark,
      foregroundColor: AppColors.textLight,
      titleTextStyle: TextStyle(
        color: AppColors.textLight,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
