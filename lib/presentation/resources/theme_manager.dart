import 'package:eco_one/presentation/resources/color_manager.dart';
import 'package:eco_one/presentation/resources/fonts_manager.dart';
import 'package:eco_one/presentation/resources/styles_manager.dart';
import 'package:eco_one/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    /* Main Colors */
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    /* CardView Theme */
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.gery,
      elevation: AppSize.s4,
    ),
    /* App Bar Theme */
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s16,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle:
          getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white),
    ),
    /* Button Theme */
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary,
    ),
    /* ElevatedButton Button Theme */
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorManager.white, fontSize: FontSize.s17),
            backgroundColor: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),
    /* Text Theme */
    textTheme: TextTheme(
      displayLarge:
          getLightStyle(color: ColorManager.white, fontSize: FontSize.s22),
      headlineLarge: getSemiBoldStyle(
          color: ColorManager.darkGrey, fontSize: FontSize.s16),
      titleMedium:
          getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14),
      bodyLarge: getRegularStyle(color: ColorManager.grey1),
      bodySmall: getRegularStyle(color: ColorManager.gery),
    ),
    /* Input Decoration Theme */
    inputDecorationTheme: InputDecorationTheme(
      // Content Padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      // Hint Style
      hintStyle:
          getRegularStyle(color: ColorManager.gery, fontSize: FontSize.s14),
      // Label Style
      labelStyle:
          getMediumStyle(color: ColorManager.gery, fontSize: FontSize.s14),
      // Error Style
      errorStyle: getRegularStyle(color: ColorManager.error),

      // Enabled Border Style
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: BorderRadius.circular(AppSize.s8)),

      // Focus Border Style
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.gery, width: AppSize.s1_5),
          borderRadius: BorderRadius.circular(AppSize.s8)),

      // Error Border Style
      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          borderRadius: BorderRadius.circular(AppSize.s8)),

      // Focus Error Border Style
      focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: BorderRadius.circular(AppSize.s8)),
    ),
  );
}
