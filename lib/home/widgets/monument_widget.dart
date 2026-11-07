import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveller/features/register/data/models/user.dart';
import 'package:traveller/features/register/firebase_services.dart';
import 'package:traveller/features/chooseExperience/data/models/attraction.dart';

/*List<Monument> favoriteMonuments = [];

class MonumentWidget extends StatefulWidget {
  Monument monument;
  bool isFav  ;


  MonumentWidget(this.monument , {this.isFav = false});

  @override
  State<MonumentWidget> createState() => _MonumentWidgetState();
}

class _MonumentWidgetState extends State<MonumentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Image.asset(
            widget.monument.image!, height: 200.h, width: 375.w, fit: BoxFit.fitWidth,),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(widget.monument.name!),
              SizedBox(width: 10,),
                widget.isFav? SizedBox(width: 1,):Checkbox(
                value: widget.monument.isChecked,
                onChanged:(value) {
                  setState(() {
                    widget.monument.isChecked = value! ;
                    if(widget.monument.isChecked == true){
                       favoriteMonuments.add(widget.monument);
                       print(favoriteMonuments);

                       FireBaseServices.modifyUserData(FirebaseAuth.instance.currentUser!.uid, convertMonumentToMap(favoriteMonuments));
                    }else{
                      favoriteMonuments.remove(widget.monument);
                      FireBaseServices.modifyUserData(FirebaseAuth.instance.currentUser!.uid, convertMonumentToMap(favoriteMonuments));
                    }
                  });
                },
              ),

            ],),
        ]
    );
  }
}*/




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveller/features/chooseExperience/data/models/attraction.dart';

class MonumentWidget extends StatelessWidget {
  final Monument monument;
  final VoidCallback onSelect;

  const MonumentWidget({
    super.key,
    required this.monument,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),

          border: Border.all(
            color: monument.isChecked!
                ? Theme.of(context).primaryColor
                : Colors.transparent,
            width: 2,
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(18.r),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ================= IMAGE =================

              Stack(
                children: [

                  GestureDetector(
                    onTap: onSelect,

                    child: SizedBox(
                      height: 210.h,
                      width: double.infinity,

                      child: Image.asset(
                        monument.image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Dark overlay when selected
                  if (monument.isChecked!)
                    Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.18),
                      ),
                    ),

                  // Check icon
                  if (monument.isChecked!)
                    Positioned(
                      top: 12.h,
                      right: 12.w,

                      child: Container(
                        width: 40.w,
                        height: 40.w,

                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),

                        child: Icon(
                          Icons.check,
                          color: Theme.of(context).primaryColor,
                          size: 25.sp,
                        ),
                      ),
                    ),
                ],
              ),

              // ================= CONTENT =================

              Padding(
                padding: EdgeInsets.all(16.w),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      monument.name!,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      monument.description!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,

                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey.shade600,
                        height: 1.4,
                      ),
                    ),

                    SizedBox(height: 14.h),

                    // ================= DETAILS =================

                    Align(
                      alignment: Alignment.centerRight,

                      child: TextButton.icon(
                        onPressed: () {
                          // افتح صفحة التفاصيل
                        },

                        icon: const Icon(
                          Icons.arrow_forward,
                          size: 18,
                        ),

                        label: const Text(
                          "See Details",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


