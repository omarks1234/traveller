import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traveller/core/resources/routes_manager/routes.dart';
import 'package:traveller/features/login/presentation/pages/login.dart';
import 'package:traveller/features/register/presentation/pages/registerScreenLog.dart';
import 'package:traveller/home/map.dart';
import 'package:traveller/home/widgets/places/cairoPlaces.dart';
import 'package:traveller/home/widgets/places/giza_placse.dart';
import 'package:traveller/home/widgets/places/luxorPlaces.dart';
import 'package:traveller/initialScreen.dart';

import '../../../features/register/presentation/pages/register_screen.dart';
import '../../../home/categories/food.dart';
import '../../../home/home_screen.dart';
import '../../../home/widgets/places/aswanPlaces.dart';

abstract class RouteManager {
  static Route<dynamic>? generateRoute (RouteSettings settings){
    switch(settings.name){
      case RoutesName.initialScreen :return MaterialPageRoute(builder: (context) => InitialScreen());
      case RoutesName.regiserScreen : return MaterialPageRoute(builder: (context) => RegisterScreen());
      case RoutesName.registerScreenLog: return MaterialPageRoute(builder: (context) => RegisterScreenLog(),settings: settings);
      case RoutesName.homeScreen: return MaterialPageRoute(builder: (context) => HomeScreen(),);
      case RoutesName.loginScreen: return MaterialPageRoute(builder: (context) => LoginScreen(),);
      case RoutesName.foodScreen: return MaterialPageRoute(builder: (context) => Food(),);
      case RoutesName.mapScreen: return MaterialPageRoute(builder: (context) => MapScreen(),);
      case RoutesName.gizaPlacesScreen: return MaterialPageRoute(builder: (context) => GizaPlaces(),);
      case RoutesName.luxorPlacesScreen: return MaterialPageRoute(builder: (context) => LuxorPlaces(),);
      case RoutesName.aswanPlacesScreen: return MaterialPageRoute(builder: (context) => AswanPlaces(),);
      case RoutesName.cairoPlacesScreen: return MaterialPageRoute(builder: (context) => CairoPlaces(),);




    }
  }

}