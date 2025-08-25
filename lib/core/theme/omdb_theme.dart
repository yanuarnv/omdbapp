import 'package:flutter/material.dart';
import 'package:omdbapp/gen/colors.gen.dart';

class OMDBTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // Color Scheme
      colorScheme: ColorScheme.light(
        primary: ColorValue.primary,
        primaryContainer: ColorValue.primaryLight,
        secondary: ColorValue.systemBlue,
        secondaryContainer: ColorValue.neutralDark1,
        surface: ColorValue.neutralDark1,
        surfaceVariant: ColorValue.neutralDark1,
        background: ColorValue.white,
        error: ColorValue.systemRed,
        onPrimary: ColorValue.white,
        onPrimaryContainer: ColorValue.white,
        onSecondary: ColorValue.white,
        onSecondaryContainer: ColorValue.white,
        onSurface: ColorValue.neutralDark3,
        onSurfaceVariant: ColorValue.neutralDark2,
        onBackground: ColorValue.neutralDark3,
        onError: ColorValue.white,
        outline: ColorValue.neutralLight1,
        outlineVariant: ColorValue.neutralLight2,
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: ColorValue.primary,
        foregroundColor: ColorValue.white,
        elevation: 2,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: ColorValue.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: const IconThemeData(color: ColorValue.white),
        actionsIconTheme: const IconThemeData(color: ColorValue.white),
      ),

      // ElevatedButton Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorValue.primary,
          foregroundColor: ColorValue.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      // OutlinedButton Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ColorValue.primary,
          side: const BorderSide(color: ColorValue.primary, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      // TextButton Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ColorValue.primary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorValue.neutralDark1.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ColorValue.neutralLight1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ColorValue.neutralLight1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ColorValue.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ColorValue.systemRed, width: 2),
        ),
        labelStyle: const TextStyle(color: ColorValue.neutralDark2),
        hintStyle: const TextStyle(color: ColorValue.neutralLight1),
      ),

      // Text Theme
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: ColorValue.neutralDark3,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: ColorValue.neutralDark3,
          fontSize: 28,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: TextStyle(
          color: ColorValue.neutralDark3,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        headlineLarge: TextStyle(
          color: ColorValue.neutralDark3,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          color: ColorValue.neutralDark3,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          color: ColorValue.neutralDark3,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: ColorValue.neutralDark3,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: ColorValue.neutralDark3,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: ColorValue.neutralDark2,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          color: ColorValue.neutralDark3,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: TextStyle(
          color: ColorValue.neutralDark3,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        bodySmall: TextStyle(
          color: ColorValue.neutralDark2,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
      ),

      // Icon Theme
      iconTheme: const IconThemeData(color: ColorValue.neutralDark2, size: 24),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: ColorValue.neutralLight1,
        thickness: 1,
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ColorValue.white,
        selectedItemColor: ColorValue.primary,
        unselectedItemColor: ColorValue.neutralDark2,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: Colors.black,
        selectedColor: ColorValue.primary,
        disabledColor: Colors.transparent,
        labelStyle: const TextStyle(color: ColorValue.neutralDark3),
        secondaryLabelStyle: const TextStyle(color: ColorValue.white),
        brightness: Brightness.light,
      ),

      // FloatingActionButton Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorValue.primary,
        foregroundColor: ColorValue.white,
        elevation: 6,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Color Scheme
      colorScheme: ColorScheme.dark(
        primary: ColorValue.primary,
        primaryContainer: ColorValue.primaryDark,
        secondary: ColorValue.systemBlue,
        secondaryContainer: ColorValue.neutralLight3,
        surface: ColorValue.neutralDark3,
        surfaceVariant: ColorValue.neutralDark3,
        background: ColorValue.white,
        error: ColorValue.systemRed,
        onPrimary: ColorValue.white,
        onPrimaryContainer: ColorValue.white,
        onSecondary: ColorValue.white,
        onSecondaryContainer: ColorValue.white,
        onSurface: ColorValue.white,
        onSurfaceVariant: ColorValue.neutralDark1,
        onBackground: ColorValue.white,
        onError: ColorValue.white,
        outline: ColorValue.neutralLight1,
        outlineVariant: ColorValue.neutralLight2,
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: ColorValue.neutralDark3,
        foregroundColor: ColorValue.white,
        elevation: 2,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: ColorValue.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: const IconThemeData(color: ColorValue.white),
        actionsIconTheme: const IconThemeData(color: ColorValue.white),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorValue.neutralLight3,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ColorValue.neutralLight1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ColorValue.neutralLight1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ColorValue.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ColorValue.systemRed, width: 2),
        ),
        labelStyle: const TextStyle(color: ColorValue.neutralDark1),
        hintStyle: const TextStyle(color: ColorValue.neutralDark2),
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ColorValue.neutralDark3,
        selectedItemColor: ColorValue.primary,
        unselectedItemColor: ColorValue.neutralDark1,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: ColorValue.neutralLight3,
        selectedColor: ColorValue.neutralDark2,
        disabledColor: ColorValue.neutralLight1,
        labelStyle: const TextStyle(color: ColorValue.white),
        secondaryLabelStyle: const TextStyle(color: ColorValue.white),
        brightness: Brightness.dark,
      ),

      // FloatingActionButton Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorValue.primary,
        foregroundColor: ColorValue.white,
        elevation: 6,
      ),
    );
  }
}
