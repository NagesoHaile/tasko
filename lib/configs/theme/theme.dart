//

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasko/core/colors/app_colors.dart';

final AppBarTheme appBarTheme = AppBarTheme(
  systemOverlayStyle: SystemUiOverlayStyle.light,
  backgroundColor: AppColors.primaryColor,
  surfaceTintColor: AppColors.primaryColor,
  elevation: 0,
  centerTitle: false,
  iconTheme: const IconThemeData(color: Colors.white),
  titleTextStyle: GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  ),
);

TextButtonThemeData textButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
  elevation: WidgetStateProperty.all<double>(0),
  foregroundColor: WidgetStateProperty.resolveWith<Color>(
    (Set<WidgetState> state) =>
        state.contains(WidgetState.disabled) ? Colors.black54 : Colors.black,
  ),
  backgroundColor: WidgetStateProperty.resolveWith<Color>(
    (Set<WidgetState> state) =>
        state.contains(WidgetState.disabled) ? Colors.white54 : Colors.white,
  ),
  textStyle: WidgetStateProperty.all<TextStyle>(
    GoogleFonts.inter(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.6,
    ),
  ),
  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      side: const BorderSide(
        color: Colors.grey,
        width: 0.3,
      ),
      borderRadius: BorderRadius.circular(4.0),
    ),
  ),
));

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  appBarTheme: appBarTheme,
  textButtonTheme: textButtonTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: WidgetStateProperty.all<double>(0),
      minimumSize:
          WidgetStateProperty.all<Size>(const Size(double.infinity, 48)),
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> state) => state.contains(WidgetState.disabled)
            ? AppColors.primaryColor
            : AppColors.primaryColor,
      ),
      foregroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> state) => state.contains(WidgetState.disabled)
            ? Colors.white60
            : Colors.white,
      ),
      textStyle: WidgetStateProperty.all<TextStyle>(
        GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.6,
        ),
      ),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
  ),
  textTheme: textTheme.apply(bodyColor: AppColors.primaryColor),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Colors.black54,
    ),
    floatingLabelStyle: GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.grey.shade500, width: 0.1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.grey.shade500, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Colors.black, width: 2),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
    backgroundColor: AppColors.primaryColor,
    extendedTextStyle: GoogleFonts.inter(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.6,
    ),
    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    backgroundColor: AppColors.primaryColor,
    elevation: 0,
    centerTitle: false,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: WidgetStateProperty.all<double>(0),
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> state) => state.contains(WidgetState.disabled)
            ? AppColors.primaryColor
            : AppColors.primaryColor,
      ),
      foregroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> state) => state.contains(WidgetState.disabled)
            ? Colors.white60
            : Colors.white,
      ),
      textStyle: WidgetStateProperty.all<TextStyle>(
        GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
  ),
  textTheme: textTheme.apply(bodyColor: Colors.white),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Colors.white60,
    ),
    floatingLabelStyle: GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      color: Colors.white60,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.grey.shade500, width: 0.1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.grey.shade500, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Colors.white60, width: 2),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
    backgroundColor: AppColors.primaryColor,
    extendedTextStyle: GoogleFonts.inter(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.6,
    ),
  ),
);

// Color Schemes

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF6750A4),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFEADDFF),
  onPrimaryContainer: Color(0xFF21005D),
  secondary: Color(0xFF625B71),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFE8DEF8),
  onSecondaryContainer: Color(0xFF1D192B),
  tertiary: Color(0xFF7D5260),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFD8E4),
  onTertiaryContainer: Color(0xFF31111D),
  error: Color(0xFFB3261E),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFF9DEDC),
  onErrorContainer: Color(0xFF410E0B),
  outline: Color(0xFF79747E),
  background: Color(0xFFFFFBFE),
  onBackground: Color(0xFF1C1B1F),
  surface: Color(0xFFFFFBFE),
  onSurface: Color(0xFF1C1B1F),
  surfaceVariant: Color(0xFFE7E0EC),
  onSurfaceVariant: Color(0xFF49454F),
  inverseSurface: Color(0xFF313033),
  onInverseSurface: Color(0xFFF4EFF4),
  inversePrimary: Color(0xFFD0BCFF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF6750A4),
  outlineVariant: Color(0xFFCAC4D0),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFD0BCFF),
  onPrimary: Color(0xFF381E72),
  primaryContainer: Color(0xFF4F378B),
  onPrimaryContainer: Color(0xFFEADDFF),
  secondary: Color(0xFFCCC2DC),
  onSecondary: Color(0xFF332D41),
  secondaryContainer: Color(0xFF4A4458),
  onSecondaryContainer: Color(0xFFE8DEF8),
  tertiary: Color(0xFFEFB8C8),
  onTertiary: Color(0xFF492532),
  tertiaryContainer: Color(0xFF633B48),
  onTertiaryContainer: Color(0xFFFFD8E4),
  error: Color(0xFFF2B8B5),
  onError: Color(0xFF601410),
  errorContainer: Color(0xFF8C1D18),
  onErrorContainer: Color(0xFFF9DEDC),
  outline: Color(0xFF938F99),
  background: Color(0xFF1C1B1F),
  onBackground: Color(0xFFE6E1E5),
  surface: Color(0xFF1C1B1F),
  onSurface: Color(0xFFE6E1E5),
  surfaceVariant: Color(0xFF49454F),
  onSurfaceVariant: Color(0xFFCAC4D0),
  inverseSurface: Color(0xFFE6E1E5),
  onInverseSurface: Color(0xFF313033),
  inversePrimary: Color(0xFF6750A4),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFD0BCFF),
  outlineVariant: Color(0xFF49454F),
  scrim: Color(0xFF000000),
);

final textTheme = TextTheme(
  titleLarge: GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 20,
  ),
  titleMedium: GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 18,
  ),
  titleSmall: GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  ),
  bodyMedium: GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 12,
  ),
  bodySmall: GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 10,
  ),
  labelMedium: GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0.8,
  ),
  headlineMedium: GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 16,
  ),
  headlineSmall: GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 14,
  ),
  labelLarge: GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 13,
  ),
);
