import 'package:flutter/material.dart';

enum LangauageType { arabic, english }

const String arabic = 'ar';
const String english = 'en';

const Locale arabicLocal = Locale("ar", "SA");
const Locale englishLocal = Locale("en", "US");

const String assetPathLocalization = "assets/translations";

extension LanguageTypeExtension on LangauageType {
  String getLang() {
    switch (this) {
      case LangauageType.arabic:
        return arabic;
      case LangauageType.english:
        return english;
    }
  }
}
