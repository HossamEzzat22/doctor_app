import 'package:doctor_app/blocs/auth/doctor_cubit.dart';
import 'package:doctor_app/models/cubit_models/getAllPatient.dart';
import 'package:doctor_app/views/addPatient.dart';
import 'package:doctor_app/views/home_screen.dart';
import 'package:doctor_app/views/login_screeen.dart';
import 'package:doctor_app/views/patient_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DoctorCubit()..getAllPatients)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:HomeScreen(),
      ),
    );
  }
}
