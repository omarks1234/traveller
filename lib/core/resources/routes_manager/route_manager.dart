import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:traveller/core/resources/routes_manager/routes.dart';
import 'package:traveller/features/chooseExperience/presentation/pages/foodDetails.dart';
import 'package:traveller/features/chooseExperience/presentation/pages/transportationDetails.dart';
import 'package:traveller/features/login/presentation/pages/login.dart';
import 'package:traveller/features/register/presentation/pages/registerScreenLog.dart';
import 'package:traveller/features/currentLocation/presentation/pages/map.dart';
import 'package:traveller/features/chooseExperience/presentation/pages/attractionsDetails.dart';

import 'package:traveller/initialScreen.dart';


import '../../../features/generatedTrip/presentation/pages/generatedTripScreen.dart';
import '../../../features/register/presentation/pages/register_screen.dart';
import '../../../features/savePreferences/presentation/pages/chooseYourExp.dart';
import '../../../features/savePreferences/presentation/pages/traveller_preference.dart';
import '../../../features/chooseExperience/presentation/widgets/foodWidget.dart';
import '../../../home/home_screen.dart';


abstract class RouteManager {
  static Route<dynamic>? generateRoute (RouteSettings settings){
    switch(settings.name){
      case RoutesName.initialScreen :return MaterialPageRoute(builder: (context) => InitialScreen());
      case RoutesName.regiserScreen : return MaterialPageRoute(builder: (context) => RegisterScreen());
      case RoutesName.registerScreenLog: return MaterialPageRoute(builder: (context) => RegisterScreenLog(),settings: settings);
     // case RoutesName.homeScreen: return MaterialPageRoute(builder: (context) => HomeScreen(),);
      case RoutesName.loginScreen: return MaterialPageRoute(builder: (context) => LoginScreen(),);
     case RoutesName.foodScreen: return MaterialPageRoute(builder: (context) => FoodDetails(),settings: settings);
      case RoutesName.mapScreen: return MaterialPageRoute(builder: (context) => MapScreen(),);
      case RoutesName.travellerPreferenceScreen: return MaterialPageRoute(builder: (context) => TravellerPreference(),);
      case RoutesName.chooseYourExperience: return MaterialPageRoute(builder: (context) => ChooseYourExperience(),);
      case RoutesName.attractions: return MaterialPageRoute(builder: (context) => Attractions(),settings: settings);
      case RoutesName.transportation: return MaterialPageRoute(builder: (context) => TransportationDetails(),settings: settings);
      case RoutesName.generatedTripScreen: return MaterialPageRoute(builder: (context) => GeneratedTripScreen(),settings: settings);



    }
  }

}