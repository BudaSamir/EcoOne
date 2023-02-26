import 'package:eco_one/presentation/fonts_manager.dart';
import 'package:flutter/material.dart';

// Created Method Return TextStyle Widget (TextStyle base)
TextStyle _getTextStyleWidget(
    double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
}

/* 
  Created Method Return Light TextStyle 
  ( Used The TrstStyle Base (_getTextStyleWidget) Method )
*/
TextStyle getLightStyle(
    {double fontSize = FontSize.s12,
    FontWeight fontWeight = FontWeightManager.light,
    required Color color}) {
  return _getTextStyleWidget(fontSize, fontWeight, color);
}

/* 
  Created Method Return Regular TextStyle 
  ( Used The TrstStyle Base (_getTextStyleWidget) Method )
*/
TextStyle getRegularStyle(
    {double fontSize = FontSize.s12,
    FontWeight fontWeight = FontWeightManager.regular,
    required Color color}) {
  return _getTextStyleWidget(fontSize, fontWeight, color);
}

/* 
  Created Method Return Medium TextStyle 
  ( Used The TrstStyle Base (_getTextStyleWidget) Method )
*/
TextStyle getMediumStyle(
    {double fontSize = FontSize.s12,
    FontWeight fontWeight = FontWeightManager.medium,
    required Color color}) {
  return _getTextStyleWidget(fontSize, fontWeight, color);
}

/* 
  Created Method Return Semi Bold TextStyle 
  ( Used The TrstStyle Base (_getTextStyleWidget) Method )
*/
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12,
    FontWeight fontWeight = FontWeightManager.semiBold,
    required Color color}) {
  return _getTextStyleWidget(fontSize, fontWeight, color);
}

/* 
  Created Method Return Bold TextStyle 
  ( Used The TrstStyle Base (_getTextStyleWidget) Method )
*/
TextStyle getBoldStyle(
    {double fontSize = FontSize.s12,
    FontWeight fontWeight = FontWeightManager.bold,
    required Color color}) {
  return _getTextStyleWidget(fontSize, fontWeight, color);
}
