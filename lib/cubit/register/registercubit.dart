
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/register/registerstates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class registerCubit extends Cubit<RegisterStates> {
  registerCubit() : super(Registerinit());
  static registerCubit get(context) => BlocProvider.of(context);
      IconData password = Icons.remove_red_eye_sharp;
  bool ispassword = true;
  void changePasswordIcon() {
    ispassword = !ispassword;
    password =
        ispassword ? Icons.remove_red_eye_sharp : Icons.remove_red_eye_outlined;
    emit(changePassword());
  }
  
  
}