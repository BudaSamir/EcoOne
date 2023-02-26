import 'package:eco_one/presentation/color_manager.dart';
import 'package:eco_one/presentation/fonts_manager.dart';
import 'package:eco_one/presentation/styles_manager.dart';
import 'package:eco_one/presentation/values_manager.dart';
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
      headline1: getSemiBoldStyle(
          color: ColorManager.darkGrey, fontSize: FontSize.s16),
      subtitle1:
          getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14),
      caption: getRegularStyle(color: ColorManager.grey1),
      bodyText1: getRegularStyle(color: ColorManager.gery),
    ),

    /* Input Decoration Theme */
  );
}
