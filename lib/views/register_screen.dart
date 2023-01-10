import 'package:doctor_app/blocs/auth/doctor_cubit.dart';
import 'package:doctor_app/blocs/auth/doctor_cubit.dart';
import 'package:doctor_app/src/app_colors.dart';
import 'package:doctor_app/utils/app_navigator.dart';
import 'package:doctor_app/views/login_screeen.dart';
import 'package:doctor_app/views/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/myText_field.dart';
import 'home_screen.dart';

class RegisterScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {
        if(state is AuthSuccessState){
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
                    Text('Register',
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
                      child: Text('Lets get you on board',
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
                      controller: cubit.NameController, labelText: 'Name', isPassword: false,),
                    MyTextField(
                      controller: cubit.EmailController, labelText: 'Email', isPassword: false,),
                    MyTextField(
                      controller: cubit.PasswordController, labelText: 'Password', isPassword: true,),
                    MyTextField(
                      controller: cubit.TitleController, labelText: 'Title', isPassword: false,),
                    MyTextField(
                      controller: cubit.AddressController, labelText: 'Address', isPassword: false,),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child:
                      RaisedButton(color:  AppColors.KGreenColor,
                        onPressed: () {
                        cubit.register();
                        },
                        child: Text(
                          'Register',
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
                        Text('Already have account! ',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        // if(state is AuthLoadingState)
                        //   LinearProgressIndicator(color: Colors.green,),
                        GestureDetector(
                            onTap: (){
                              AppNavigator(context, true,LoginScreen());
                            },
                            child: Container(
                                child:
                                Text('Login',
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
