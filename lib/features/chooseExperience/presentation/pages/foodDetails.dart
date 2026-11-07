import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveller/DI/field_injection.dart';
import 'package:traveller/core/resources/routes_manager/routes.dart';
import 'package:traveller/features/chooseExperience/data/models/food.dart';
import 'package:traveller/features/savePreferences/presentation/manager/choose_experience_cubit.dart';
import 'package:traveller/features/savePreferences/presentation/manager/save_preferences_cubit.dart';

import '../widgets/foodWidget.dart';

class FoodDetails extends StatefulWidget {
   FoodDetails({super.key});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  // الأكلات اللي المستخدم اختارها
  final List<Food> selectedFoods = [];

  void toggleSelectedFood(Food food) {
    setState(() {
      if (selectedFoods.contains(food)) {
        selectedFoods.remove(food);
      } else {
        selectedFoods.add(food);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (context) => getIt<ChooseExperienceCubit>(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          title: const Text(
            "Egyptian Food",
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
                    "Taste Egypt",
                    style: TextStyle(
                      fontSize: 27.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 6.h),

                  Text(
                    "Choose the Egyptian dishes you would like to try during your trip.",
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

            // Food list
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),

                itemCount: egyptianFoods.length,

                separatorBuilder: (context, index) {
                  return SizedBox(height: 18.h);
                },

                itemBuilder: (context, index) {
                  final food = egyptianFoods[index];

                  return FoodWidget(
                    food: food,
                    isSelected: selectedFoods.contains(food),
                    onSelect: () {
                      toggleSelectedFood(food);
                    },
                  );
                },
              ),
            ),

            // Continue button
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 18.h),

              child: BlocListener<ChooseExperienceCubit, ChooseExperienceState>(
                listener: (context, state) {
                  if (state is ChooseExperienceSuccessState){
                    Navigator.pushNamed(context, RoutesName.transportation , arguments: tripId);
                  }
                  if (state is ChooseExperienceErrorState){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage)),
                    );
                  }
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 54.h,

                  child:
                      BlocBuilder<ChooseExperienceCubit, ChooseExperienceState>(
                        builder: (context, state) {
                          if (state is ChooseExperienceLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          return ElevatedButton(
                            onPressed: selectedFoods.isEmpty
                                ? null
                                : () {
                                   context.read<ChooseExperienceCubit>().chooseExperience({
                                    "food": selectedFoods.map((food) => food.name).toList(),
                                   }, tripId);
                                    // بعدين هنا:
                                    // 1. تحفظ الأكلات في Firestore
                                    // 2. و تنتقل للـ Transportation screen
                                  },

                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                            ),

                            child: Text(
                              selectedFoods.isEmpty
                                  ? "Choose Food"
                                  : "Continue (${selectedFoods.length})",

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
