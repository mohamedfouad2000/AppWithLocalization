import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Shared/commponents.dart';
import 'package:flutter_application_1/cubit/login/logincubit.dart';
import 'package:flutter_application_1/cubit/login/loginstates.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/lang/applocal.dart';
import 'package:flutter_application_1/register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class login extends StatelessWidget {
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return Logincubit();
      },
      child: BlocConsumer<Logincubit, loginStates>(
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
                          "${getLang(context, "LOGIN")}",
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextForm(
                          Con: userController,
                          lable: "${getLang(context, "UserName")}",
                          prefixIcon: Icon(Icons.email),
                          val: "${getLang(context, "Please Enter User ")}"),
                      SizedBox(
                        height: 20,
                      ),
                      TextForm(
                          Con: passwordController,
                          lable: "${getLang(context, "Password")}",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Logincubit.get(context).password),
                          val: "${getLang(context, "Please Enter password")}",
                          type: TextInputType.visiblePassword,
                          obscureText: Logincubit.get(context).ispassword,
                          fun_su: () {
                            Logincubit.get(context).changePasswordIcon();
                          }),
                      SizedBox(
                        height: 20,
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
                                "${getLang(context, "login")}",
                                style: TextStyle(color: Colors.white),
                              ))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${getLang(context, "Don't have an acount?")}",
                            style: TextStyle(fontSize: 20),
                          ),
                          FlatButton(
                              onPressed: () {
                                Navandremove(context, register());
                              },
                              child: Text(
                                "${getLang(context, "Register")}",
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
