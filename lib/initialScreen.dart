import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traveller/core/resources/assets_manager.dart';
import 'package:traveller/core/resources/routes_manager/routes.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int langVal = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 80.h),
              ),
                onPressed: () {
                 Navigator.pushNamed(context, RoutesName.regiserScreen);
                },
                child: Text("Create an account").tr()),
            SizedBox(height: 20.h,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 80.h),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.loginScreen);
                },
                child: Text("Login").tr()),
                SizedBox(height: 50.h,),
                AnimatedToggleSwitch.rolling(
                    style: ToggleStyle(

                    ),
                    current: langVal,
                    values: [0,1],
                     onChanged: (i) =>setState(() {
                       langVal = i ;
                       if (langVal == 0 ){
                         context.setLocale(Locale("en"));
                       }else{
                         context.setLocale(Locale("zh" ));
                       }
                     }),
                  iconList: [SvgPicture.asset(AssetsManager.english , width: 40.w , height: 40.h,) , SvgPicture.asset(AssetsManager.chinese , width: 40.w , height: 40.h,) ],
                ),
          ],
        ),
      ),
    );
  }
}
