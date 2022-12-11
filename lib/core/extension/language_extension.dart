import 'package:flutter/material.dart';

import '../localization/app_localization.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get multiLanguage => AppLocalizations.of(this);
}
