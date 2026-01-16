import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_study/widgets/app_colors.dart';


ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.navy,
    scaffoldBackgroundColor: AppColors.bg,
    textTheme: GoogleFonts.interTextTheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.5,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.black12,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      shape: StadiumBorder(),
    ),
  );
}
