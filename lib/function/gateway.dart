import 'package:client_user/function/env.dart';
import 'package:client_user/function/myInfo.dart';
import 'package:client_user/Getx/collector.dart';
// import 'package:client_user_modify/function/token/tokenFunction.dart';
// import 'package:client_user/provider/electricProvider.dart';
// import 'package:client_user/provider/idCollector.dart';
import 'package:client_user/Getx/tokenGetX.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

//통신부 getx로 변환
class Gateway {
  final token = new FlutterSecureStorage();
  // final provider = new IdCollector();
  // final tokenFunction = new TokenFunction();

  final tokenController = Get.put(TokenGetX());
  final controller = Get.put(IdCollector());

  Future<MyInfo> me(context) async {
    await TokenGetX().tokenCheck();

    var url = Env.url + '/api/auth/me';
    String value = await token.read(key: 'token');
    String myToken = ("Bearer " + value);

    final response = await http.post(Uri.parse(url), headers: {
      'Authorization': myToken,
    });

    Map<String, dynamic> list = jsonDecode(response.body);

    return MyInfo(
      nick: list['nick_name'],
      point: list['point'].toString(),
      img_url: list['profile_img'].toString(),
    );
  }

  Future<List<dynamic>> getCampList(context) async {
    await TokenGetX().tokenCheck();

    List<dynamic> campList;
    var url = Env.url + '/api/campsite/user/list';
    String value = await token.read(key: 'token');
    String myToken = ("Bearer " + value);

    var response = await http.get(Uri.parse(url), headers: {
      'Authorization': myToken,
    });

    var d = utf8.decode(response.bodyBytes);
    campList = jsonDecode(d) as List;

    return campList;
  }

  Future<Null> getCategoryList(context) async {
    await TokenGetX().tokenCheck();

    var url = Env.url + '/api/category/user/list';
    String value = await token.read(key: 'token');
    String myToken = ("Bearer " + value);
    List ciList = [];
    List cnList = [];
    List<dynamic> categoryList;

    // print("provider id: " +
    //     Provider.of<IdCollector>(context, listen: true)
    //         .selectedCampId
    //         .toString());
    var response = await http.post(Uri.parse(url), headers: {
      'Authorization': myToken,
    }, body: {
      'campsite_id': controller.selectedCampId.toString(),
      // Provider.of<IdCollector>(context, listen: true)
      //     .selectedCampId
      //     .toString(),
    });
    var data = utf8.decode(response.bodyBytes);
    categoryList = jsonDecode(data) as List;

    for (var i = 0; i < categoryList.length; i++) {
      // Provider.of<IdCollector>(context, listen: true)
      controller.setCMap(categoryList[i]['id'], categoryList[i]['name']);
    }
  }

  //카테고리 디바이스 리스트 작성 중
  Future<Null> getCategoryDeviceList(context) async {
    await TokenGetX().tokenCheck();

    var url = Env.url + '/api/reservation/user/detail/list';
    String value = await token.read(key: 'token');
    String myToken = ("Bearer " + value);
    List ciList = [];
    List cnList = [];
    List<dynamic> categoryList;

    // print("provider id: " +
    //     Provider.of<IdCollector>(context, listen: true)
    //         .selectedCampId
    //         .toString());
    var response = await http.post(Uri.parse(url), headers: {
      'Authorization': myToken,
    }, body: {
      'id': controller.selectedCampId.toString(),
      // Provider.of<IdCollector>(context, listen: true)
      //     .selectedCampId
      //     .toString(),
    });
    var data = utf8.decode(response.bodyBytes);
    categoryList = jsonDecode(data) as List;

    for (var i = 0; i < categoryList.length; i++) {
      // Provider.of<IdCollector>(context, listen: true)
      controller.setCMap(categoryList[i]['id'], categoryList[i]['name']);
    }
  }
}
