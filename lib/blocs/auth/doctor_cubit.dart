import 'package:bloc/bloc.dart';
import 'package:doctor_app/models/cubit_models/addPatient.dart';
import 'package:doctor_app/services/dio_helper/dio_helper.dart';
import 'package:doctor_app/services/sp_helper/sp_helper.dart';
import 'package:doctor_app/services/sp_helper/sp_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/cubit_models/authentication.dart';
import '../../models/cubit_models/getAllPatient.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(AuthInitial());
  static DoctorCubit get(context)=>BlocProvider.of(context);

  Authentication? authentication;
  GetAllPatients? getAllPatients;
  AddNewPatient? addNewPatient;


  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController NameController = TextEditingController();
  TextEditingController TitleController = TextEditingController();
  TextEditingController AddressController = TextEditingController();
  TextEditingController diagnosisController = TextEditingController();




  register(){
    emit(AuthLoadingState());
    DioHelper.postData(url: 'auth/register',
        data: {
        "name": NameController.text,
        "password":PasswordController.text,
        "email": EmailController.text,
        "title": TitleController.text,
        "address": AddressController.text,}).then((value)
    {
      emit(AuthSuccessState());
      print(value.data);

      authentication=Authentication.fromJson(value.data);
      SharedPrefrenceHelper.saveData(key: SharedPreferencesKeys.token, value: authentication!.token);
      print(authentication!.data!.name);
    }
    ).catchError((erorr){
      emit(AuthErorrState());
      print(erorr);
    });
    }

    
  login(){
    emit(AuthLoginLoadingState());
    DioHelper.postData(url: 'auth/login',
        data:{
      "email": EmailController.text,
      "password":PasswordController.text
        }).then((value){
          emit(AuthLoginSuccessState());
          authentication=Authentication.fromJson(value.data);
          SharedPrefrenceHelper.saveData(key: SharedPreferencesKeys.token, value: authentication!.token);
          print(value.data);
    }).catchError((erorr){
      emit(AuthLoginErorrState());
      print(erorr);
    });
  }


  getAllPatient(){
    emit(DoctorGetAllPatientLoading());
    print('Loading');
    DioHelper.getData(url: 'patients',
        query:{
          "token":SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token)
        })
        .then((value){
      emit(DoctorGetAllPatientSucess());
      getAllPatients=GetAllPatients.fromJson(value.data);
      print(getAllPatients!.data!.data![2].name);

    }).catchError((erorr){
      emit(DoctorGetAllPatientErorr());
      print(erorr);
    });
  }


  addPatient(){
    emit(DoctorAddNewPatientLoading());
    print('loading');
    DioHelper.postData(url: 'doctorpatients',
        query:
        {
          "token":SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token)
        },
        data: {
      "name" : NameController.text,
      "date_of_birth": "2.2.1999",
      "diagnosis":diagnosisController.text ,
      "address": AddressController.text,
      "visit_time": "16.12.2022"
        }
    ).then((value){
      print(value.data);
      emit(DoctorAddNewPatientSuccess());

      addNewPatient=AddNewPatient.fromJson(value.data);

      print(addNewPatient!.data!.address);

    }).catchError((erorr){
      emit(DoctorAddNewPatientErorr());
      print(erorr);
    });
  }



  }

