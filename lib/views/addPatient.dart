import 'package:doctor_app/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth/doctor_cubit.dart';
import '../components/myText_field.dart';
import '../src/app_colors.dart';
import '../utils/app_navigator.dart';
import 'login_screeen.dart';


class AddPatient extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {
        if(state is DoctorAddNewPatientSuccess){
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
                    Text('Add Patient',
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
                      child: Text('Let\s be reason to make someone feel better',
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
                      controller: cubit.PasswordController, labelText: 'date_of_birth', isPassword: false,),
                    MyTextField(
                      controller: cubit.diagnosisController, labelText: 'diagnosis', isPassword: false,),
                    MyTextField(
                      controller: cubit.AddressController, labelText: 'address', isPassword: false,),
                    MyTextField(
                      controller: cubit.PasswordController, labelText: 'visit_time', isPassword: false,),
                    SizedBox(
                      height: 20,
                    ),
                    if(state is DoctorAddNewPatientLoading)
                      LinearProgressIndicator(color: AppColors.KGreenColor,),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child:
                      RaisedButton(color:  AppColors.KGreenColor,
                        onPressed: () {
                          cubit.addPatient();
                        },
                        child: Text(
                          'ADD Patient',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: AppColors.KGreenColor)),
                      ),
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
