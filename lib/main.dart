import 'package:doctor_app/services/dio_helper/dio_helper.dart';
import 'package:doctor_app/services/sp_helper/sp_helper.dart';
import 'package:doctor_app/src/app_root.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefrenceHelper.init();
  DioHelper.init();
  runApp(AppRoot());
}

