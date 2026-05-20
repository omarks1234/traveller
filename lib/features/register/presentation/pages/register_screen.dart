import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveller/core/resources/routes_manager/routes.dart';
import 'package:traveller/features/register/data/models/user.dart';
import 'package:traveller/features/register/presentation/widgets/input.dart';

import '../../../../core/resources/helper_functions/validation.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String selectedGender = "male";
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController birthController;
  late TextEditingController genderController;
  @override
  void initState() {
    nameController = TextEditingController();
    ageController = TextEditingController();
    birthController = TextEditingController();
    genderController = TextEditingController();
  }

  void dispose() {
    super.dispose();
    nameController.dispose();
    ageController.dispose();
    birthController.dispose();
    genderController.dispose();
  }

  GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Travelller")),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
              Input("name", validation: Validation.nameValidator,controller: nameController,),
              Input("age ", validation: Validation.ageValidator , controller: ageController,),
              Input(
                "Birth date",
                icon: Icon(Icons.calendar_month_sharp, size: 20),
                controller: birthController,
                validation: Validation.birthValidator,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("gender"),
              ),
              SizedBox(height: 6.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                  value: selectedGender,
                  validator: Validation.genderValidator,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  items: ["male", "female"]
                      .map(
                        (gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.all(30.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        if (key.currentState!.validate()) {
                          Navigator.pushNamed(
                            context,
                            RoutesName.registerScreenLog,
                            arguments: TravellerUser(
                              name: nameController.text,
                              age: ageController.text,
                              birthDate: birthController.text,
                              gender: selectedGender,
                            ),
                          );
                        }
                      },
                      child: Icon(
                        Icons.keyboard_arrow_right_outlined,
                        size: 50,
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
