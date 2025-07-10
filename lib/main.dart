// import 'package:belajar_flutter/meet_25/tugas_15/login_screen.dart';
// import 'package:belajar_flutter/meet_25/tugas_15/profile_screen.dart';
// import 'package:belajar_flutter/meet_25/tugas_15/register_screen.dart';
// import 'package:belajar_flutter/meet_11/login_screen.dart';
// import 'package:belajar_flutter/meet_12/meet_12a.dart';
// import 'package:belajar_flutter/meet_12/meet_12b.dart';
// import 'package:belajar_flutter/meet_16/login_screen.dart';
// import 'package:belajar_flutter/meet_16/register_screen.dart';
// import 'package:belajar_flutter/meet_2/meet_2.dart';
// import 'package:belajar_flutter/meet_3/meet_3_a.dart';
import 'package:belajar_flutter/meet_33/gmaps.dart';
// import 'package:belajar_flutter/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: "/",
      // routes: {
      //   "/": (context) => SplashScreen(),
      //   "/login": (context) => LoginScreen(),
      //   "/meet_2": (context) => MeetDua(),
      //   LoginScreenApp.id: (context) => LoginScreenApp(),
      //   RegisterScreenApp.id: (context) => RegisterScreenApp(),
      //   LoginScreenApi.id: (context) => LoginScreenApi(),
      //   RegisterScreenAPI.id: (context) => RegisterScreenAPI(),
      //   ProfileUserScreen.id: (context) => ProfileUserScreen(),
      //   MeetTigaA.id: (context) => MeetTigaA(),
      //   Meet12AInputWidget.id: (context) => Meet12AInputWidget(),
      //   MeetDuaBelasB.id: (context) => MeetDuaBelasB(),
      // },
      debugShowCheckedModeBanner: false,
      title: 'Belajar Flutter PPKD B 2',

      theme: ThemeData(
        // useMaterial3: true,
        fontFamily: 'Poppins',
        // primaryColor: AppColor.myblue1,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()},
        ),
      ),
      home: GmapsScreen(),
    );
  }
}
