import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Shared/commponents.dart';
import 'package:flutter_application_1/cubit/home/homecubit.dart';
import 'package:flutter_application_1/cubit/home/homestates.dart';
import 'package:flutter_application_1/lang/applocal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class settings extends StatelessWidget {
  Object? v;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return homecubit();
      },
      child: BlocConsumer<homecubit, homestates>(
        builder: (BuildContext context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text('${getLang(context, "settings")}',style: TextStyle(color: Colors.white),),
                actions: [TextButton(onPressed: (){
                  print("siu");
                  homecubit.get(context).changeThem();
                }, child: Icon(Icons.change_circle_rounded,color: Colors.white))],
              ),
              body: Column(
                children: [
                  // Text("register"),
                  DropdownButton(
                      items: [
                        DropdownMenuItem(
                          child: Text("en"),
                          value: 'en',
                        ),
                        DropdownMenuItem(
                          child: Text("ar"),
                          value: 'ar',
                        ),
                      ],
                      // value: homecubit.get(context).selected,
                      onChanged: (value) async {
                        print(value);
                        v = value;
                        // homecubit.get(context).changeLang(value:value);
                        //  await   Get.updateLocale(Locale('${homecubit.get(context).selected}'));
                      }),

                  TextButton(
                      onPressed: () async {
                        homecubit.get(context).changeLang(value: v);
                        await Get.updateLocale(
                            Locale('${homecubit.get(context).selected}'));
                      },
                      child: Text("change langage",style: TextStyle(color: Colors.white))),
                  // TextButton(onPressed: () {
                  //  homecubit.get(context).changeThem();
                  //                     }, child: Icon(Icons.change_circle,color: Colors.white,)),
                ],
              ),
              drawer: drawer(context));
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }
}
