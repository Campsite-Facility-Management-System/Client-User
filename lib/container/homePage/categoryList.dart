import 'package:client_user/function/env.dart';
// import 'package:client_user/function/deviceList.dart';
// import 'package:client_user/function/gateway.dart';
import 'package:client_user/Getx/campDetailGetX.dart';
import 'package:client_user/Getx/categoryDeviceGetX.dart';
import 'package:client_user/container/homePage/categoryDeviceTile.dart';
//import 'package:client_user/model/homePage/camp/campData.dart';
import 'package:client_user/screen/homePage/myCamp.dart';
import 'package:client_user/container/homePage/categoryTile.dart';
import 'package:client_user/container/homePage/profile.dart';
// import 'package:client_user_modify/provider/idCollector.dart';
import 'package:client_user/Getx/collector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  // @override
  // CategoryListState createState() => CategoryListState();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryDeviceGetX());
    controller.apiDetailData();
    return Scaffold(
      appBar: AppBar(
        title: Text('객실 리스트'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 750,
                child: GetBuilder<CampDetailGetX>(
                  builder: (_) {
                    return ListView.builder(
                      // shrinkWrap: true,
                      itemCount: controller.detailData == null
                          ? 0
                          : controller.detailData?.length,
                      itemBuilder: (context, index) {
                        return CategoryDeviceTile.buildTile(
                            context, controller.detailData[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class CategoryListState extends State<CategoryList> {}
