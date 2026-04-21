import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traveller/core/resources/routes_manager/routes.dart';
import 'package:traveller/features/register/presentation/pages/registerScreenLog.dart';

import '../../../features/register/presentation/pages/register_screen.dart';

abstract class RouteManager {
  static Route<dynamic>? generateRoute (RouteSettings settings){
    switch(settings.name){
      case RoutesName.regiserScreen : return MaterialPageRoute(builder: (context) => RegisterScreen());
      case RoutesName.registerScreenLog: return MaterialPageRoute(builder: (context) => RegisterScreenLog(),);

    }
  }

}