import 'dart:convert';

import 'app_localization.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  Map<String, dynamic> translate = jsonDecode(jsonString);

  @override
  String get setting => translate["setting"];
  // setting <=> AppString.setting
}

const jsonString = """
    {
    "setting": "الإعدادات",

    }
    """;
