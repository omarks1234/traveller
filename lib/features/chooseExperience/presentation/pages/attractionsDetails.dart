import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveller/DI/field_injection.dart';
import 'package:traveller/core/resources/routes_manager/routes.dart';
import 'package:traveller/features/chooseExperience/data/models/attraction.dart';
import 'package:traveller/features/register/firebase_services.dart';
import 'package:traveller/features/savePreferences/presentation/manager/choose_experience_cubit.dart';

import '../../../../home/widgets/monument_widget.dart';

class Attractions extends StatefulWidget {
  Attractions({super.key });

  @override
  State<Attractions> createState() => _AttractionsState();
}

class _AttractionsState extends State<Attractions> {
  // الأماكن اللي المستخدم اختارها
  final List<Monument> preferredPlaces = [];

  void togglePreferredPlace(Monument monument) {
    setState(() {
      if (preferredPlaces.contains(monument)) {
        preferredPlaces.remove(monument);
        monument.isChecked = false;
      } else {
        preferredPlaces.add(monument);
        monument.isChecked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String?;
    if (tripId == null) {
      return Scaffold(
        body: Center(
          child: Text('Trip ID is missing.'),
        ),
      );
    }
    print("#########Trip ID: $tripId###########");
    return BlocProvider(
      create: (context) => getIt<ChooseExperienceCubit>(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          title: const Text(
            "Attractions",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),

        body: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Explore Egypt",
                    style: TextStyle(
                      fontSize: 27.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 6.h),

                  Text(
                    "Choose the places you would like to visit during your trip.",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey.shade600,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),

            // Attractions list
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),

                itemCount: monuments.length,

                separatorBuilder: (context, index) {
                  return SizedBox(height: 18.h);
                },

                itemBuilder: (context, index) {
                  final monument = monuments[index];

                  return MonumentWidget(
                    monument: monument,
                    onSelect: () {
                      togglePreferredPlace(monument);
                    },
                  );
                },
              ),
            ),

            // Continue button
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 18.h),
              child: BlocListener< ChooseExperienceCubit,ChooseExperienceState >(
                listener: (context, state) {
                  if (state is ChooseExperienceSuccessState) {
                    // Handle success state if needed
                     Navigator.pushNamed(context, RoutesName.foodScreen , arguments:tripId);

                  } else if (state is ChooseExperienceErrorState) {
                    // Handle failure state if needed
                     ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage)));

                  }
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 54.h,
                  child: BlocBuilder<
                      ChooseExperienceCubit,
                      ChooseExperienceState>(
                    builder: (context, state) {
                      if (state is ChooseExperienceLoadingState){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                        return ElevatedButton(
                        onPressed: preferredPlaces.isEmpty
                            ? null
                            : () async{




                                // Call the Cubit method to save preferred places
                                context.read<ChooseExperienceCubit>().chooseExperience({
                                  "attractivePlaces": preferredPlaces.map((place) =>place.name).toList(),
                                } ,  tripId);

                              },

                          // هنا بعدين تحفظ الأماكن في Firestore
                          // أو تنتقل للـ Food screen


                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),

                        child: Text(
                          preferredPlaces.isEmpty
                              ? "Choose Places"
                              : "Continue (${preferredPlaces.length})",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
