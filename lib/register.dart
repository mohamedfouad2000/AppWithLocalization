import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Shared/commponents.dart';
import 'package:flutter_application_1/cubit/register/registercubit.dart';
import 'package:flutter_application_1/cubit/register/registerstates.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/lang/applocal.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class register extends StatelessWidget {
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return registerCubit();
      },
      child: BlocConsumer<registerCubit, RegisterStates>(
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                       Center(
                        child: Text(
                          "${getLang(context, "Register")}",
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextForm(
                          Con: userController,
                          lable: "${getLang(context, "Name")}",
                          prefixIcon: Icon(Icons.person),
                          val: "${getLang(context, "Please Enter name ")}"),
                      SizedBox(
                        height: 20,
                      ),
                      TextForm(
                          Con: emailController,
                          lable: "${getLang(context, "email")}",
                          prefixIcon: Icon(Icons.email),
                          val: "${getLang(context, "Please Enter email ")}"),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                     TextForm(
                            Con: passwordController,
                            lable: "${getLang(context, "Password")}",
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon:
                                Icon(registerCubit.get(context).password),
                            val: "${getLang(context, "Please Enter password")}",
                            type: TextInputType.visiblePassword,
                            obscureText:
                                registerCubit.get(context).ispassword,
                            fun_su: () {
                              registerCubit
                                  .get(context)
                                  .changePasswordIcon();
                            }),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextForm(
                          Con: phoneController,
                          lable: "${getLang(context, "phone")}",
                          prefixIcon: Icon(Icons.phone),
                          val: "${getLang(context, "Please Enter phone ")}"),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                          width: double.infinity,
                          height: 50,
                          color: Colors.blue,
                          child: TextButton(
                              onPressed: () {
                                 if (formkey.currentState!.validate()) {
                                 Navandremove(context, home());
                                 }
                              },
                              child: Text(
                                "${getLang(context, "Register")}",
                                style: TextStyle(color: Colors.white),
                              ))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                           "${getLang(context, "You have an acount?")}",
                            style: TextStyle(fontSize: 20),
                          ),
                          FlatButton(
                              onPressed: () {
                                Navandremove(context, login());
                              },
                              child: Text(
                                "${getLang(context, "login")}",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 19),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }
}
