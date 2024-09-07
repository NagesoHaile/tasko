import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasko/core/colors/app_colors.dart';

class Style {
  /// Custom page transitions
  static const _pageTransitionsTheme = PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );

  /// Light Mode
  static final ThemeData light = ThemeData(
    // scaffoldBackgroundColor: AppColors.scafoldBacgroundColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.black,
      selectionColor: Colors.black.withOpacity(0.4),
      selectionHandleColor: Colors.black,
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      menuStyle: const MenuStyle(),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        floatingLabelStyle: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    ),
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
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
    ),
    listTileTheme: ListTileThemeData(
      iconColor: Colors.black,
      titleTextStyle: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      elevation: WidgetStateProperty.all<double>(0),
      foregroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> state) => state.contains(WidgetState.disabled)
            ? Colors.black54
            : Colors.black,
      ),
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> state) => state.contains(WidgetState.disabled)
            ? Colors.white54
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
          side: const BorderSide(
            color: Colors.grey,
            width: 0.3,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    )),
    tabBarTheme: TabBarTheme(
      labelStyle: GoogleFonts.roboto(
        color: Colors.white,
        fontWeight: FontWeight.w800,
        fontSize: 14,
        letterSpacing: 0.8,
      ),
      unselectedLabelStyle: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: Colors.white70,
        letterSpacing: 0.8,
      ),
      indicatorColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.tab,
    ),
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
    colorScheme: const ColorScheme.light(),
    pageTransitionsTheme: _pageTransitionsTheme,
    textTheme: textTheme.apply(bodyColor: Colors.black),
    popupMenuTheme: PopupMenuThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ),
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

  /// Dark Mode
  static final ThemeData dark = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.white,
      selectionColor: Colors.white.withOpacity(0.4),
      selectionHandleColor: Colors.white,
    ),
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Colors.black,
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
    pageTransitionsTheme: _pageTransitionsTheme,
    textTheme: textTheme.apply(bodyColor: Colors.white),
    popupMenuTheme: PopupMenuThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Colors.white,
      ),
      floatingLabelStyle: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.grey.shade700, width: 0.1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.white60, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.white60, width: 2),
      ),
    ),
  );
}

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
