part of 'doctor_cubit.dart';

@immutable
abstract class DoctorState {}

class AuthInitial extends DoctorState {}

class AuthLoadingState extends DoctorState {}
class AuthSuccessState extends DoctorState {}
class AuthErorrState extends DoctorState {}


class AuthLoginLoadingState extends DoctorState {}
class AuthLoginSuccessState extends DoctorState {}
class AuthLoginErorrState extends DoctorState {}


class DoctorGetAllPatientLoading extends DoctorState {}
class DoctorGetAllPatientSucess extends DoctorState {}
class DoctorGetAllPatientErorr extends DoctorState {}


class DoctorAddNewPatientLoading extends DoctorState {}
class DoctorAddNewPatientSuccess extends DoctorState {}
class DoctorAddNewPatientErorr extends DoctorState {}