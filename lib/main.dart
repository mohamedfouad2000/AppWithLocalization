import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/cubit/home/homecubit.dart';
import 'package:flutter_application_1/cubit/home/homestates.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/lang/applocal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Sharedp.init();

  

  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) { return homecubit();  }, 
    child: BlocConsumer<homecubit,homestates>(builder: (BuildContext context, state) { return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
                backgroundColor: Colors.cyan,

  drawerTheme:const DrawerThemeData(
    backgroundColor: Colors.white,
  ) ,
        primarySwatch: Colors.cyan,
        brightness: Brightness.light,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        backgroundColor: Colors.cyan,
      ),
        ),
        // ignore: prefer_const_constructors
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.cyan,
            // ignore: deprecated_member_use
            backwardsCompatibility: false,
            
            
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.grey,
              statusBarIconBrightness: Brightness.light,
            )),
      ), 
      darkTheme:ThemeData(
        backgroundColor: HexColor("403E44"),
        
          drawerTheme:const DrawerThemeData(
    backgroundColor:Colors.black,
  ) ,
        // ignore: prefer_const_constructors
        textButtonTheme: TextButtonThemeData(
           style: TextButton.styleFrom(primary: Colors.grey[400],
            backgroundColor: Colors.grey,),
        ),
        
       
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
        appBarTheme:  AppBarTheme(
            backgroundColor: HexColor("403E44"),
            // ignore: deprecated_member_use
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.grey,
              statusBarIconBrightness: Brightness.dark,
            )),
            
      ),
      themeMode:homecubit.get(context).darkmode? ThemeMode.dark:ThemeMode.light,
      home: home(),
      localizationsDelegates: [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en", ""),
        Locale("ar", ""),
        
      ],
      localeResolutionCallback: (currentLang, supportLang) {
        if (currentLang != null) {
          for (Locale locale in supportLang) {
            if (locale.languageCode == currentLang.languageCode) {
              // mySharedPreferences.setString("lang",currentLang.languageCode) ;
              print(currentLang);
              return currentLang;
            }
          }
        }
        return supportLang.first;
      },
    ); }, listener: (BuildContext context, Object? state) {  },) ,);
  }
}
