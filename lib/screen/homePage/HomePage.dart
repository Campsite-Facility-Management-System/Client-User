// import 'package:client_user/container/campTimeline/campList.dart';
// import 'package:client_user/function/token/tokenFunction.dart';
import 'package:client_user/Getx/tokenGetX.dart';
import 'package:client_user/screen/signPage/loginScreen.dart';
// import 'package:campsite_fms_app_manager/model/homePage/camp/myCamp.dart';
import 'package:client_user/container/homePage/campList.dart';
// import 'package:campsite_fms_app_manager/model/homePage/profile.dart';
// import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:client_user/Getx/homePage/homePageGetX.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:client_user/function/env.dart';
import 'dart:convert';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  // @override
  // HomePageState createState() => HomePageState();

  final token = new FlutterSecureStorage();
  // final tokenFunction = TokenFunction();
  final controller = new TokenGetX();

  _check() async {
    bool result = await TokenGetX().tokenCheck();
    if (!result) {
      // Navigator.pushNamed(context, '/login');
      Get.to(LoginScreen());
    }
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _check();
  // }

  @override
  void onInit() {
    _check();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    '캠핑장 조회',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              CampList(),
            ],
          ),
        ),
      ),
    );
  }
}
