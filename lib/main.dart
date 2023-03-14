import 'package:assignment_ropstam/utils/constants/app_providers.dart';
import 'package:assignment_ropstam/utils/routes/routes.dart';
import 'package:assignment_ropstam/utils/routes/routes_name.dart';
import 'package:assignment_ropstam/utils/theme/theme_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: appProviders,
        child: Builder(
          builder: (BuildContext context) {
            return MaterialApp(
              darkTheme: Styles.themeData(true, context),
              themeMode: ThemeMode.system,
              theme: Styles.themeData(false, context),
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              initialRoute: RoutesName.splash,
              onGenerateRoute: Routes.generateRoute,
            );
          },
        ));
  }
}
