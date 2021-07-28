import 'dart:convert';
import 'package:client_user/function/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CampDetailGetX extends GetxController {
  final token = FlutterSecureStorage();
  var selectedCategoryId;
  var selectedCampId;
  List ciList = [];
  List cnList = [];
  Map<String, int> cMap = new Map();
  Map<String, int> campIndex = new Map();
  var detailData;

  setCategoryId(id) {
    this.selectedCategoryId = id;
  }

  setCampId(id) {
    this.selectedCampId = id;
  }

  setCIList(list) {
    this.ciList = list;
  }

  setCNList(list) {
    this.cnList = list;
  }

  setCMap(index, name) {
    this.cMap[name] = index;
  }

  setCampIndex(index, name) {
    this.campIndex[name] = index;
  }

  setSelectedCampId(id) {
    this.selectedCampId = id;
    // print('campId: ' + selectedCampId.toString());
  }

  setDetailData(data) {
    this.detailData = data;
    update();
  }

  @override
  onInit() {
    super.onInit();
  }

  apiCampDetail() async {
    // var url = Env.url + '/api/campsite/user/detail/list';
    var url = Env.url +
        '/api/reservation/user/campsite/info?campsite_id=' +
        selectedCampId.toString();
    String value = await token.read(key: 'token');
    String myToken = ("Bearer " + value);

    var response = await http.get(
      Uri.parse(url),
      // headers: {
      //   'campsite_id': selectedCampId.toString(),
      // },
      // body: {
      //   'campsite_id': selectedCampId.toString(),
      // }
    );

    print("tagging" + detailData.toString());
    print("tag2" + selectedCampId.toString());

    await setDetailData(jsonDecode(utf8.decode(response.bodyBytes)));

    // await setDetailData(
    //     jsonDecode(utf8.decode((await http.get(Uri.parse(url))).bodyBytes)));

    // print(d)
    cMap.clear();
    for (var i = 0; i < detailData.length; i++) {
      setCMap(detailData[i]['id'], detailData[i]['name']);
    }

    update();

    print(detailData.toString());
  }

  // getData() async {
  //   var url = Env.url +
  //       '/api/reservation/user/campsite/info?campsite_id=' +
  //       selectedCampId.toString();
  // }
  // String value = await token.read(key: 'token');
  // String myToken = ("Bearer " + value);

  // var response = await http.get(url);

  // , headers: {
  //   'Authorization': myToken,
  // }, body: {
  //   'campsite_id': selectedCampId.toString(),
  // }
  // );

//     await setCampDetailData(
//         jsonDecode(utf8.decode((await http.get(Uri.parse(url))).bodyBytes)));

//     print(campDetailData);
//     print(campDetailData['img_url'][0]['img_url']);

//     // for (var i = 0; i < categoryList.length; i++) {
//     //   setCMap(categoryList[i]['id'], categoryList[i]['name']);
//     // }
//   }

// //   @override
// //   void onInit() {
// //     // TODO: implement onInit
// //     super.onInit();
// //   }

}
