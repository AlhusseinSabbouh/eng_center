// ignore_for_file: public_member_api_docs, sort_constructors_first
/*

#### here some guides how the hooks work  ####

useEffect((){
    here when the hook starts
  return (){
    here when the hook dispose
  };
} , [
  here we put the vars which rebuild the useEffect
  when they change , when it's empty, that's mean
  it will be build for once
    ]
])

 #### hook builder ####

we can use hookBuilder to build the useState that maybe
change while the program is running

final toggle = useState(false);

//or we can use

final toggleVN = useValueNotifier(false);
//and in the HookBuilder this toggleVN
final toggle = useValueListenable(toggleVN);
toggle.value = !toggle.value;


#### animation with hooks ####

final controller = useAnimationController(
  duration: Duration(seconds: 1))..repeat(reverse: true);
final animation = useMovement(() => 
  Tween(begin: 2.0 , end : 15.0).animate(controller)  
);
final recording = useState(false);


//in AnimatedBuilder
animation : animation
and we can use animation.value




#### when we need a value that need async ####

final apiServe = useMemoized(() => DummyAPI() , []);
final httpCall = useValueNotifier(apiServe.getData());
! into HookBuilder
final future = useValueListenable(httpCall);
! into ElevatedButton
httpCall.value = apiServe.getData();


*/

// class MyApp extends StatefulWidget {
//   const MyApp._internal();
//   static const MyApp _instance = MyApp._internal();
//   factory MyApp() => _instance;

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../config/routes/app_routes.dart';
import '../core/localization/local_cubit/local_cubit/local_cubit.dart';
import '../core/localization/local_cubit/local_cubit/local_state.dart';

class MyApp extends HookWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocaleCubit>(
      create: (context) => LocaleCubit(),
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (_, localState) {
          return const MaterialApp(
            // supportedLocales: AppLocalizations.supportedLocales,
            // localizationsDelegates: AppLocalizations.localizationsDelegates,
            // locale: localState.locale,
            debugShowCheckedModeBanner: false,
            // theme: getApplicationTheme(),
            initialRoute: Routes.splashRoute,
            onGenerateRoute: RouteGenerator.getRoute,
          );
        },
      ),
    );
  }
}
