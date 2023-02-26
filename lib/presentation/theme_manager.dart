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
      titleTextStyle: getRegularStyle(
          fontSize: FontSizeManager.s16, color: ColorManager.white),
    ),
    /* Buttom Theme */
    /* Text Theme */
    /* Input Decoration Theme */
  );
}
