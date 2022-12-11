import 'dart:convert';

import 'app_localization.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  Map<String, dynamic> translate = jsonDecode(jsonString);
  @override
  String get setting => translate['setting'];
  // setting <=> AppString.setting

}

const jsonString = """
    {
    "setting": "Setting",

    }
    """;
