import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveller/features/chooseExperience/data/models/transportation.dart';

class TransportationWidget extends StatelessWidget {
  final Transportation transportation;
  final bool isSelected;
  final VoidCallback onSelect;

  const TransportationWidget({
    super.key,
    required this.transportation,
    required this.isSelected,
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
            color: isSelected
                ? Theme.of(context).primaryColor
                : Colors.transparent,
            width: 2,
          ),

          boxShadow: [
            BoxShadow(
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

                  SizedBox(
                    height: 210.h,
                    width: double.infinity,

                    child: Image.asset(
                      transportation.imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // ================= SELECTED OVERLAY =================

                  if (isSelected)
                    Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.18),
                      ),
                    ),

                  // ================= CHECK ICON =================

                  if (isSelected)
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

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Expanded(
                      child: Text(
                        transportation.name!,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // ================= SELECT BUTTON =================

                    Icon(
                      isSelected
                          ? Icons.check_circle
                          : Icons.arrow_forward_ios,
                      color: isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                      size: 22.sp,
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