import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveller/core/resources/routes_manager/route_manager.dart';
import 'package:traveller/core/resources/routes_manager/routes.dart';
import 'package:traveller/core/resources/theme_manager.dart';



class Traveller extends StatelessWidget {
  const Traveller({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
       return MaterialApp(
          theme: ThemeManager.lightThemeMode ,
          darkTheme:ThemeManager.darkThemeMode ,
          themeMode: ThemeMode.light,
          onGenerateRoute: RouteManager.generateRoute,
          initialRoute: RoutesName.initialScreen,
          debugShowCheckedModeBanner: false,
        );
      },

    );
  }
}
