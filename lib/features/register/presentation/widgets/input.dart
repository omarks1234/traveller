import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveller/core/resources/helper_functions/birthDay.dart';

class Input extends StatefulWidget {

   String title ;
   String? Function(String?)? validation ;
   TextEditingController? controller ;
   Icon? icon ;
   bool? ishidden;
   Input(this.title , {this.validation,this.controller , this.icon , this.ishidden=false}  );

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool hidden = false  ;


  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.all(8.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title ),
            SizedBox(height: 6.h,),
            TextFormField(
              obscureText: widget.ishidden!,
              obscuringCharacter: "*",
              readOnly: widget.title=="Birth date",
              controller: widget.controller ,
              validator: widget.validation ,
              decoration: InputDecoration(
                    suffixIcon: Container(
                      height: 20,
                      width: 20,
                      child: (widget.title=="Birth date")?InkWell(child:widget.icon,onTap: () async {

                           DateTime? birth = await BirthDate.pickData(context);
                           if (birth != null) {
                           widget.controller!.text =
                               "${birth.day} / ${birth.month}/${birth.year} ";

                                   }
                                  }
                         ):
                         InkWell(child:widget.icon,onTap: (){
               bool hidden  ;
              if (widget.title=="password " || widget.title == "re-password"){
                hidden = widget.ishidden! ;
              setState(() {
              widget.ishidden = !hidden ;
              });
              }
              }


              ),

                    ) ,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide(
                          color: Colors.blue
                      )
                  )
              ),

            )
          ],

        ),
      );
  }
}
