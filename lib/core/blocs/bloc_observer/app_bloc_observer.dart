import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  // @override
  // void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
  //   super.onChange(bloc, change);
  //   log('onChange(${bloc.runtimeType}, $change)');
  // }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onCreate(BlocBase bloc) {
    log('onCreate(create :: ${bloc.runtimeType})');
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    log('onClose(close :: ${bloc.runtimeType})');

    super.onClose(bloc);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('onTransition(${bloc.runtimeType}, $transition)');
    super.onTransition(bloc, transition);
  }
}
