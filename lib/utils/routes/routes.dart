import 'package:assignment_ropstam/utils/routes/custom_page_route.dart';
import 'package:assignment_ropstam/utils/routes/routes_name.dart';
import 'package:assignment_ropstam/view/auth_screens/login_view.dart';
import 'package:assignment_ropstam/view/auth_screens/sign_up_view.dart';
import 'package:assignment_ropstam/view/auth_screens/splash_screen.dart';
import 'package:assignment_ropstam/view/main_screens/add_edit_car.dart';
import 'package:assignment_ropstam/view/main_screens/home_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      /// LOGIN FLOW
      /// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      ///
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());

      ///
      ///
      case RoutesName.logIn:
        return CustomPageRoute(
          child: const LoginScreen(),
          direction: AxisDirection.up,
        );

      ///
      case RoutesName.signUp:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SignUpView(),
        );

      ///
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomePage(),
        );

      ///
      case RoutesName.addcar:
        final results = settings.arguments as Map;
        final bool? edit = results['edit'];
        final List<String>? cars = results['cars'];
        final int? index = results['index'];
        return MaterialPageRoute(
          builder: (BuildContext context) => AddCars(
            edit: edit,
            cars: cars,
            index: index,
          ),
        );

      /// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      /// when no route found default route
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
