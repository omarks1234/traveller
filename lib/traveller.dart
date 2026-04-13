import 'package:flutter/material.dart';
import 'package:traveller/core/resources/routes_manager/route_manager.dart';
import 'package:traveller/core/resources/routes_manager/routes.dart';



class Traveller extends StatelessWidget {
  const Traveller({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData() ,
      onGenerateRoute: RouteManager.generateRoute,
      initialRoute: RoutesName.regiserScreen,

    );
  }
}
