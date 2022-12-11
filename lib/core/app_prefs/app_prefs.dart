import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../localization/language/language_manager.dart';

const String prefsKeyLanguage = 'prefsKeyLanguage';
const String prefsKeyOnBoardingScreenViewed = "prefsKeyOnBoardingScreenViewed";
const String prefsKeyIsUserLoggedIn = "prefsKeyIsUserLoggedIn";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(
    this._sharedPreferences,
  );

  Future<String> getAppLanguage() async {
    String? currentLanguage = _sharedPreferences.getString(prefsKeyLanguage);
    return (currentLanguage != null && currentLanguage.isNotEmpty)
        ? currentLanguage
        : LangauageType.english.getLang();
  }

  Future<void> setLanguage(String lang) async {
    if (lang == 'ar') {
      await _sharedPreferences.setString(
          prefsKeyLanguage, LangauageType.arabic.getLang());
    } else {
      await _sharedPreferences.setString(
          prefsKeyLanguage, LangauageType.english.getLang());
    }
  }

  Future<void> changeLang() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LangauageType.arabic.getLang()) {
      _sharedPreferences.setString(
          prefsKeyLanguage, LangauageType.english.getLang());
    } else {
      _sharedPreferences.setString(
          prefsKeyLanguage, LangauageType.arabic.getLang());
    }
  }

  Future<Locale> getLocale() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LangauageType.arabic.getLang()) {
      return arabicLocal;
    } else {
      return englishLocal;
    }
  }

  Future<void> setOnBoardingScreenViewed() async {
    await _sharedPreferences.setBool("prefsKeyOnBoardingScreenViewed", true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool("prefsKeyOnBoardingScreenViewed") ??
        false;
  }

  Future<void> setUserLoggedIN() async {
    await _sharedPreferences.setBool("prefsKeyIsUserLoggedIn", true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool("prefsKeyIsUserLoggedIn") ?? false;
  }
}
