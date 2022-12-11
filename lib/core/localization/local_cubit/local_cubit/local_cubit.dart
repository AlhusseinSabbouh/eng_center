import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eng_center/core/app_prefs/app_prefs.dart';
import 'package:eng_center/core/dependency_injection/di.dart';
import 'package:eng_center/core/localization/local_cubit/local_cubit/local_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  LocaleCubit() : super(const SelectedLocale(Locale('en'))) {
    _appPreferences
        .getAppLanguage()
        .then((locale) => emit(SelectedLocale(Locale(locale))));
  }

  void toArabic() async {
    await _appPreferences.setLanguage("ar");
    emit(const SelectedLocale(Locale("ar")));

    // BlocProvider.of<LocaleCubit>(context).toArabic();
  }

  void toEnglish() async {
    await _appPreferences.setLanguage("en");
    emit(const SelectedLocale(Locale("en")));
  }
}


// ! in the page where we use multi language we need in the build
// ! final lang = context.multiLanguage;
// ! then just we use lang.setting
