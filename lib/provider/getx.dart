import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IdCollector extends GetxController {
  var selectedCategoryId;
  var selectedCampId;
  List ciList = [];
  List cnList = [];
  Map<String, int> cMap = new Map();
  Map<String, int> campIndex = new Map();

  setCategoryId(id) {
    this.selectedCategoryId = id;
    update();
  }

  setCampId(id) {
    this.selectedCampId = id;
    update();
  }

  setCIList(list) {
    this.ciList = list;
    update();
  }

  setCNList(list) {
    this.cnList = list;
    update();
  }

  setCMap(index, name) {
    this.cMap[name] = index;
    update();
  }

  setCampIndex(index, name) {
    this.campIndex[name] = index;
    update();
  }
}
