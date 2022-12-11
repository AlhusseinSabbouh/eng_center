import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_prefs/app_prefs.dart';
import '../localization/local_cubit/local_cubit/local_cubit.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  instance.registerLazySingleton<AppPreferences>(
      () => AppPreferences(instance<SharedPreferences>()));
  instance.registerLazySingleton<LocaleCubit>(() => LocaleCubit());

// * here we need to add all the global bloc as
// * registerLazySinglton
// !   final sharedPrefs = await SharedPreferences.getInstance();
// !   instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
// !   instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));
// !   Dio dio = await instance<DioFactory>().getDio();
// !   instance.registerLazySingleton<Repository>(
// !      () => RepositoryImpl(instance(), instance(), instance()));
}

// * add all the useCase that we need as a factory
// * because we need to use for just one time
// * and we can add the bloc that we need to use them for one screen
/*
initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
    instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
  }
}

*/
