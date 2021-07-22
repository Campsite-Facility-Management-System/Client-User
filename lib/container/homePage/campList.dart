// import 'dart:js';

import 'package:client_user/Getx/homePage/homePageGetX.dart';
import 'package:client_user/container/homePage/campTile.dart';
import 'package:client_user/function/env.dart';
import 'package:client_user/function/gateway.dart';
// import 'package:client_user/model/homePage/camp/campData.dart';
import 'package:client_user/screen/homePage/myCamp.dart';
import 'package:client_user/container/homePage/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

class CampList extends StatelessWidget {
  final token = new FlutterSecureStorage();
  var resCount = '0';
  var ordCount = '0';
  List<dynamic> list = [];

  // @override
  // CampListState createState() => CampListState();
  // final gateway = new Gateway();

  final homePageController = Get.put(HomePageGetX());
  // Future<Null> _getData() async {
  //   list = await gateway.getCampList();
  // }
  // obx로 감싸기
  //   setState(() {
  //     list;
  //   });
  // }

  // void initState() {
  //   super.initState();
  //   _getData();
  // }

  @override
  Widget build(BuildContext context) {
    // return Obx(() => Container(
    //     margin: EdgeInsets.only(left: 10, right: 10),
    //     height: 620,
    //     child: ListView.builder(
    //       itemCount: campList.length,
    //       itemBuilder: (context, index) {
    //         if (index == 0) {
    //           return ProfileScreen();
    //         } else {
    //           return MyCamp.buildTile(context, campList[index]);
    //         }
    //         // print("index: " + index.toString());
    //         // print("list index: " + list[index].toString());
    //       },
    //     )));
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      height: 620,
      child: ListView.builder(
        itemCount: campList.length, //list == null ? 0 : list?.length + 1,
        itemBuilder: (context, index) {
          //obx로 getx내 리스트로 선언해서 불러오기. 리스트 선언을 클래스 말고 전역으로 선언하는 방식도 필요.
          if (index == 0) {
            return ProfileScreen();
          } else {
            return MyCamp.buildTile(context, list[index - 1]);
          }
          // print("index: " + index.toString());
          // print("list index: " + list[index].toString());
        },
      ),
    );
  }
}

// class CampListState extends State<CampList> {}
