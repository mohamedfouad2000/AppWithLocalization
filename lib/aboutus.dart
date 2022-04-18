import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Shared/commponents.dart';
import 'package:flutter_application_1/cubit/home/homecubit.dart';
import 'package:flutter_application_1/cubit/home/homestates.dart';
import 'package:flutter_application_1/lang/applocal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class aboutus extends StatelessWidget {
  const aboutus({ Key? key }) : super(key: key);

@override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) { return homecubit();   },
    child: BlocConsumer<homecubit,homestates>(builder: (BuildContext context, state) { return Scaffold(
      appBar: AppBar(
        actions: [
          Text('data'),
        ],
        title: Text("${getLang(context, "aboutus")}"),
      ),
      body: Container(
        child: Text("${getLang(context, "about Us")}"),
      ),
      drawer:drawer(context) );
    }, listener: (BuildContext context, Object? state) {  },),);
    
    }
}