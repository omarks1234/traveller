import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveller/DI/field_injection.dart';
import 'package:traveller/features/login/presentation/manager/login_cubit.dart';
import 'package:traveller/features/register/presentation/widgets/input.dart';

import '../../../../core/resources/helper_functions/validation.dart';
import '../../../../core/resources/routes_manager/routes.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late  TextEditingController emailController ;
  late TextEditingController passwordController ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> key = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => getIt.get<LoginCubit>(),
      child: Scaffold(
        appBar: AppBar(
            title: Text("Traveller"),
            automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding:  EdgeInsets.all(10.0),
          child: Form(
            key: key,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 70.h,),
                  Input(
                    "e-mail",
                    validation: Validation.emailValidator,
                    controller: emailController,
                  ),
                  Input(
                    "password ",
                    validation: Validation.passValidator,
                    icon: Icon(Icons.panorama_photosphere_select_sharp),
                    ishidden: true,
                    controller: passwordController,
                  ),
                  SizedBox(height: 100.h),
                  BlocConsumer< LoginCubit, LoginState>(
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is LoginError) {
                        // toast message
                      }
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 80.h),
                        ),
                        onPressed: () async {
                          if (key.currentState!.validate()) {
              
              
                            await   BlocProvider.of<LoginCubit>(
                              context,
                            ).login(emailController.text, passwordController.text);
              
              
                          }
                        },
                        child: Text("Log-In"),
                      );
                    },
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        Navigator.pushNamedAndRemoveUntil(context, RoutesName.travellerPreferenceScreen,(route) => false,);
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
