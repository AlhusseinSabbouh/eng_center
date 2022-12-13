import 'package:flutter/material.dart';

import '../../core/resources/values_manager.dart';
import '../styles/color_manager.dart';
import '../styles/font_manager.dart';
import '../styles/text_style_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      //main colors
      primaryColor: AppColors.primary,
      primaryColorLight: AppColors.lightPrimary,
      primaryColorDark: AppColors.darkPrimary,
      disabledColor: AppColors.grey1,
      splashColor: AppColors.lightPrimary,

      //cardView theme
      cardTheme: const CardTheme(
        color: AppColors.white,
        shadowColor: AppColors.grey,
        elevation: AppSize.s8,
      ),

      //app bar theme
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: AppColors.primary,
          elevation: AppSize.s8,
          shadowColor: AppColors.lightPrimary,
          titleTextStyle: getRegularStyle(
              color: AppColors.white, fontSize: FontSizeManger.s16)),

      //button theme
      buttonTheme: const ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: AppColors.grey1,
        buttonColor: AppColors.primary,
        splashColor: AppColors.lightPrimary,
      ),

      //elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(
                  color: AppColors.white, fontSize: FontSizeManger.s18),
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s8)))),

      //input decoration theme (text form field)
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(AppPadding.p8),
          hintStyle: getRegularStyle(
              color: AppColors.grey, fontSize: FontSizeManger.s14),
          labelStyle: getMeduimStyle(
              color: AppColors.grey, fontSize: FontSizeManger.s14),
          errorStyle: getRegularStyle(color: AppColors.error),
          disabledBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.grey, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
          enabledBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.grey, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
          focusedBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.primary, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
          errorBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.error, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.primary, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)))),

      //text theme
      textTheme: TextTheme(
          headlineMedium: getRegularStyle(
              color: AppColors.darkGrey, fontSize: FontSizeManger.s14),
          headlineLarge: getSemiBoldStyle(
              color: AppColors.darkGrey, fontSize: FontSizeManger.s16),
          titleMedium: getMeduimStyle(
              color: AppColors.primary, fontSize: FontSizeManger.s16),
          bodyLarge: getRegularStyle(color: AppColors.grey1),
          bodySmall: getRegularStyle(color: AppColors.grey),
          titleSmall: getRegularStyle(
              color: AppColors.white, fontSize: FontSizeManger.s16),
          displayLarge: getLightStyle(
              color: AppColors.white, fontSize: FontSizeManger.s22),
          labelSmall: getBoldStyle(
              color: AppColors.primary, fontSize: FontSizeManger.s12)));
}
