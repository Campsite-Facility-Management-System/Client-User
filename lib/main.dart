import 'package:client_user/screen/homePage/campDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:client_user/screen/signPage/loginScreen.dart';
import 'package:client_user/screen/signPage/signUpScreen.dart';
import 'package:client_user/screen/homePage/HomePage.dart';
import 'package:client_user/container/campTimeline/categoryList.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: '모닥모닥',
        debugShowCheckedModeBanner: false, //debug ribbon remove
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/signIn': (context) => SignUpScreen(),
          '/homePage': (context) => HomePage(),
          // '/campDetail': (context) => CampDetailScreen(),
        });
  }
}
