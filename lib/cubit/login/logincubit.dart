import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/login/loginstates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Logincubit extends Cubit<loginStates> {
  Logincubit() : super(Loginit());
  static Logincubit get(context) => BlocProvider.of(context);
    IconData password = Icons.remove_red_eye_sharp;
  bool ispassword = true;
  void changePasswordIcon() {
    ispassword = !ispassword;
    password =
        ispassword ? Icons.remove_red_eye_sharp : Icons.remove_red_eye_outlined;
    emit(changePassword());
  }
}