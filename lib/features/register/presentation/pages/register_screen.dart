import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveller/core/resources/routes_manager/routes.dart';
import 'package:traveller/features/register/presentation/widgets/input.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Travelller"),
       ),
       body: SingleChildScrollView(
         child: Column(
           children: [
             SizedBox(height: 12.h,),
             Input(title: "name",),
             Input(title: "age ",),
             Input(title: "Birth date",),
             Input(title: "gender",),
             SizedBox(height :30 ) ,
             Padding(
               padding:  EdgeInsets.all(30.sp),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, RoutesName.registerScreenLog);
                        },
                       child: Icon(Icons.keyboard_arrow_right_outlined , size: 50,)),
                 ],
               ),
             )
           ],
         ),
       ),

     );
  }

}