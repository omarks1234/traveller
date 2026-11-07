import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveller/DI/field_injection.dart';
import 'package:traveller/features/chooseExperience/data/models/transportation.dart';
import 'package:traveller/features/generatedTrip/data/data_sources/aiTripService.dart';
import 'package:traveller/features/generatedTrip/data/models/generatedIternaryTrip.dart';
import 'package:traveller/features/generatedTrip/presentation/manager/generated_trip_cubit.dart';
import 'package:traveller/features/savePreferences/presentation/manager/choose_experience_cubit.dart';

import '../../../../core/resources/routes_manager/routes.dart';
import '../widgets/transportationWidget.dart';

class TransportationDetails extends StatefulWidget {

  TransportationDetails({super.key });


  @override
  State<TransportationDetails> createState() => _TransportationDetailsState();
}

class _TransportationDetailsState extends State<TransportationDetails> {
  // وسائل المواصلات اللي المستخدم اختارها
  final List<Transportation> selectedTransportation = [];

  void toggleSelectedTransportation(Transportation transportation) {
    setState(() {
      if (selectedTransportation.contains(transportation)) {
        selectedTransportation.remove(transportation);
      } else {
        selectedTransportation.add(transportation);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final AiTripService aiTripService = AiTripService();
    final tripId = ModalRoute.of(context)!.settings.arguments as String;
    return MultiBlocProvider(
   providers: [
        BlocProvider(
        create: (context) => getIt<ChooseExperienceCubit>(),),
     BlocProvider(
       create: (context) => getIt<GeneratedTripCubit>(),),
   ],

      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          title: const Text(
            "Transportation",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),

        body: Column(
          children: [
            // ================= HEADER =================
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Move Around Egypt",
                    style: TextStyle(
                      fontSize: 27.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 6.h),

                  Text(
                    "Choose the transportation options you would like to use during your trip.",
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

            // ================= TRANSPORTATION LIST =================
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),

                itemCount: transportations.length,

                separatorBuilder: (context, index) {
                  return SizedBox(height: 18.h);
                },

                itemBuilder: (context, index) {
                  final transportation = transportations[index];

                  return TransportationWidget(
                    transportation: transportation,

                    isSelected: selectedTransportation.contains(transportation),

                    onSelect: () {
                      toggleSelectedTransportation(transportation);
                    },
                  );
                },
              ),
            ),

            // ================= CONTINUE BUTTON =================
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 18.h),

              child: MultiBlocListener(
  listeners: [
    BlocListener<ChooseExperienceCubit, ChooseExperienceState>(
                listener: (context, state) async{
                  if (state is ChooseExperienceSuccessState ) {
                    print('ChooseExperienceSuccessState');
                    // Navigate to the next page or show a success message
                    final trip = await context.read<GeneratedTripCubit>().getTripById(FirebaseAuth.instance.currentUser!.uid, tripId);
                    context.read<GeneratedTripCubit>().generatedTrip(trip);
                  } else if (state is ChooseExperienceErrorState) {
                    // Show an error message

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage)));

                  }

                },
),
    BlocListener<GeneratedTripCubit, GeneratedTripState>(
      listener: (context, state) {
        if (state is GeneratedTripSuccess) {
          final generatedItenerary=state.generatedItenerary  ;
          print("######$generatedItenerary######");
          final generatedTrip = GeneratedIternaryTrip.fromJson(generatedItenerary);

          Navigator.pushNamed(context, RoutesName.generatedTripScreen , arguments: generatedTrip);
        }

        // TODO: implement listener
      },
    ),
  ],
  child: SizedBox(
                  width: double.infinity,
                  height: 54.h,

                  child: BlocBuilder<ChooseExperienceCubit,
                      ChooseExperienceState>(
                    builder: (context, state) {
                      if (state is ChooseExperienceLoadingState)  {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ElevatedButton(
                        onPressed: selectedTransportation.isEmpty
                            ? null
                            : () async{
                          context.read<ChooseExperienceCubit>().chooseExperience({

                            'transportation': selectedTransportation.map((e) => e.name).toList(),

                          }, tripId);
                          // 1. تحفظ وسائل المواصلات في Firestore
                          // 2. أو تنتقل للخطوة التالية
                          // 3. أو تبدأ Generate Trip
                        },

                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),

                        child: Text(
                          selectedTransportation.isEmpty
                              ? "Choose Transportation"
                              : "Continue (${selectedTransportation.length})",

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
