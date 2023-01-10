import 'package:doctor_app/services/sp_helper/sp_helper.dart';
import 'package:doctor_app/services/sp_helper/sp_keys.dart';
import 'package:doctor_app/utils/app_navigator.dart';
import 'package:doctor_app/views/addPatient.dart';
import 'package:doctor_app/views/login_screeen.dart';
import 'package:doctor_app/views/patient_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth/doctor_cubit.dart';
import '../src/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.KGreenColor,
          title: Center(
            child: Text(
              'My Patients',
              style: TextStyle(
                  fontSize: 30
              ),
            ),
          ),
          actions: [
            IconButton(onPressed: (){
              SharedPrefrenceHelper.removeData(key: SharedPreferencesKeys.token);
              AppNavigator(context, true, LoginScreen());
            },
                icon: Icon(Icons.logout,
                color: Colors.red,))
          ],
        ),
        body:
        BlocConsumer<DoctorCubit, DoctorState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = DoctorCubit.get(context);
            return
              cubit.getAllPatients==null?
              Center(child: Container(width:200,child: Image.network('https://cdn-icons-png.flaticon.com/512/40/40471.png',fit: BoxFit.cover,))):
              ListView.builder(
                  itemCount:1,//cubit.getAllPatients!.data!.data!.length,
                  itemBuilder: (BuildContext context, int index) =>Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Container(
                        height: 90,
                        child: GestureDetector(
                          onTap: (){
                            AppNavigator(context, false, PatientDetailsScreen(patients: cubit.getAllPatients!.data!.data![index],));
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                       'patient1' ,//cubit.addNewPatient!.data!.name.toString(),
                                        style: TextStyle(
                                            fontSize: 20
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.alarm,
                                            size: 15,),
                                          SizedBox(
                                            width: 7,
                                          ),

                                          Text(
                                           '2.2.2022',//cubit.addNewPatient!.data!.visitTime.toString(),
                                            style: TextStyle(
                                                fontSize: 15
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Icon(
                                      Icons.arrow_forward_ios,
                                        size: 30,),


                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          height: 5,
                          thickness: 2,
                          color: AppColors.KGreenColor,
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            )
              );//MyPatientButton(name:cubit.getAllPatients!.data!.data![index].name.toString(), date: cubit.getAllPatients!.data!.data![index].toString()));
          },
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppNavigator(context, false, AddPatient());
        },
        backgroundColor: AppColors.KGreenColor,
        child: Icon(Icons.add,
        size: 40,),

      ),
    );
  }
}
