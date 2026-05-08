import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveller/DI/field_injection.dart';
import 'package:traveller/core/resources/helper_functions/validation.dart';
import 'package:traveller/core/resources/routes_manager/routes.dart';
import 'package:traveller/features/register/presentation/manager/sign_in_model_view_cubit.dart';
import 'package:traveller/home/home_screen.dart';

import '../widgets/input.dart';

class RegisterScreenLog extends StatefulWidget {
  RegisterScreenLog();

  @override
  State<RegisterScreenLog> createState() => _RegisterScreenLogState();
}

class _RegisterScreenLogState extends State<RegisterScreenLog> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  late TextEditingController emailController ;
  late TextEditingController passController ;

  @override
  void initState() {
    // TODO: implement initState
    emailController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
      create: (context) => getIt.get<SignInModelViewCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Travelller"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: key,
              child: Column(
                children: [

                  Input("e-mail", validation: Validation.emailValidator ,controller: emailController,),
                  Input( "password ", validation: Validation.passValidator,icon: Icon(Icons.panorama_photosphere_select_sharp,) , ishidden: true,controller: passController,),
                  Input( "re-password", validation: Validation.passValidator,icon: Icon(Icons.panorama_photosphere_select_sharp) , ishidden: true,),
                  SizedBox(height:100.h),
                  BlocConsumer<SignInModelViewCubit,SignInModelViewState>(
                    builder: (context, state)
                    {
                      if (state is SignInModelViewLoading){
                        return Center(child: CircularProgressIndicator(),);
                      }
                      if (state is SignInModelViewFail){
                        // toast message
                      }
                      return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 80.h),
                      ),
                      onPressed: () async{
                        if (key.currentState!.validate()) {
                           BlocProvider.of<SignInModelViewCubit>(context).signIn(emailController.text, passController.text);

                        }
                      },
                      child: Text("Sign-In"),
                    );
                    },
                    listener: (context, state) {
                      if(state is SignInModelViewSuccess){
                        Navigator.pushReplacementNamed(context , RoutesName.homeScreen );
                      }
                    },

                  ),

                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}
