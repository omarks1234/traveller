import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveller/core/resources/routes_manager/routes.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          children: [
            SizedBox(height: 300.h,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 80.h),
              ),
                onPressed: () {
                 Navigator.pushNamed(context, RoutesName.regiserScreen);
                },
                child: Text("Create an account ")),
            SizedBox(height: 20.h,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 80.h),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.regiserScreen);
                },
                child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
