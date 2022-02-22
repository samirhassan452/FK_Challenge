import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show AppColors, NavigationService, Routers, RoutesNames;
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData();
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: "Orders Analysis",
      theme: theme.copyWith(
        // for appbar outside app when expand app from navigation system
        // appears for old androids
        primaryColor: AppColors.darkTurquoise,
        colorScheme: theme.colorScheme.copyWith(
          // for appbar and other things inside app
          primary: AppColors.darkTurquoise,
        ),
      ),
      initialRoute: RoutesNames.splashRoute,
      onGenerateRoute: Routers.allRoutes,
    );
  }
}
