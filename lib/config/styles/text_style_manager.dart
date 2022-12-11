import 'package:eng_center/config/styles/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(Color color, FontWeight fontWeight, double fontSize) {
  return TextStyle(
    color: color,
    fontFamily: FontConstants.fontFamily,
    fontWeight: fontWeight,
    fontSize: fontSize,
  );
}

TextStyle getLightStyle(
    {required Color color, double fontSize = FontSizeManger.s12}) {
  return _getTextStyle(color, FontWeightManger.light, fontSize);
}

TextStyle getRegularStyle(
    {required Color color, double fontSize = FontSizeManger.s12}) {
  return _getTextStyle(color, FontWeightManger.regular, fontSize);
}

TextStyle getMeduimStyle(
    {required Color color, double fontSize = FontSizeManger.s12}) {
  return _getTextStyle(color, FontWeightManger.medium, fontSize);
}

TextStyle getSemiBoldStyle(
    {required Color color, double fontSize = FontSizeManger.s12}) {
  return _getTextStyle(color, FontWeightManger.semiBold, fontSize);
}

TextStyle getBoldStyle(
    {required Color color, double fontSize = FontSizeManger.s12}) {
  return _getTextStyle(color, FontWeightManger.bold, fontSize);
}
