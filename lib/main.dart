// todo flutter pub run build_runner build --delete-conflicting-outputs

import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
// import 'core/blocs/bloc_observer/app_bloc_observer.dart';
import 'core/dependency_injection/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterServicesBinding.ensureInitialized();
  // WidgetsFlutterBinding.ensureInitialized();
  // await BlocOverrides.runZoned(() async {
  //   // WidgetsFlutterBinding.ensureInitialized()
  //   // await initAppModule();
  //   return runApp(const MyApp());
  // }, blocObserver: AppBlocObserver());

  // Bloc.observer = AppBlocObserver();
  await initAppModule();

  runApp(const MyApp());
}
