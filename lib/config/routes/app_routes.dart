import 'package:flutter/material.dart';

class Routes {
  // static const String splashRoute = '/';
  // static const String loginRoute = '/login';
  static const String homeRoute = '/home';
  static const String splashRoute = '/login';
}

class RouteGenerator {
  //! here we make our routes
  //! and we can use blocProvider.value
  //! to get instance from any bloc that we init in the get it
  //! but if we make a new instance of bloc then we need to dispose him

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        // initLoginModule();
        return MaterialPageRoute(builder: (_) => const FirstPage());
      case Routes.homeRoute:
        // initLoginModule();
        return MaterialPageRoute(builder: (_) => const FirstPage());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(centerTitle: true, title: Text("nothing")),
            ));
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("First page")),
    );
  }
}
