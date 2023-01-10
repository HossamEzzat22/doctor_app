import 'package:doctor_app/blocs/auth/doctor_cubit.dart';
import 'package:doctor_app/blocs/auth/doctor_cubit.dart';
import 'package:doctor_app/src/app_colors.dart';
import 'package:doctor_app/utils/app_navigator.dart';
import 'package:doctor_app/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/myText_field.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {
        if(state is AuthLoginSuccessState){
          AppNavigator(context, true, HomeScreen());
        }
      },
      builder: (context, state) {
        var cubit = DoctorCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.KGreenColor,
            title: Center(
              child: Text(
                'Doctor App',
                style: TextStyle(
                    fontSize: 30
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Login',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.black,
                      //fontWeight: FontWeight.bold
                    ),),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 240,
                    child: Text('Welcome back, please login to your account',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        //fontWeight: FontWeight.bold
                      ),),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    controller: cubit.EmailController, labelText: 'Email', isPassword: false,),
                  MyTextField(
                    controller: cubit.PasswordController, labelText: 'Password', isPassword: true,),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child:
                    RaisedButton(color:  AppColors.KGreenColor,
                      onPressed: () {
                      cubit.login();
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: AppColors.KGreenColor)),
                  ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account? ',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      GestureDetector(
                          onTap: (){
                            AppNavigator(context, true,RegisterScreen());
                          },
                          child: Container(
                              child:
                              Text('Register Now',
                                style: TextStyle(
                                    color: AppColors.KGreenColor
                                ),))),
                    ],
                  ),
                ]
              ),
            ),
          ),
        );
      },
    );
  }
}
