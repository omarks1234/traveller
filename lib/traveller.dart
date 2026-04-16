import 'package:flutter/material.dart';
import 'package:traveller/core/resources/routes_manager/route_manager.dart';
import 'package:traveller/core/resources/routes_manager/routes.dart';
import 'package:traveller/core/resources/theme_manager.dart';



class Traveller extends StatelessWidget {
  const Traveller({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeManager.lightThemeMode ,
      darkTheme:ThemeManager.darkThemeMode ,
      themeMode: ThemeMode.light,
      onGenerateRoute: RouteManager.generateRoute,
      initialRoute: RoutesName.regiserScreen,

    );
  }
}
