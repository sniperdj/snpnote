import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:snpnote/core/model/home/snp_insist_model.dart';
import 'package:snpnote/core/services/http_request.dart';
import 'package:snpnote/ui/pages/home/mock_home.dart';
import 'dart:convert';

class SNPHomeViewModel extends ChangeNotifier {
  // 获取首页cell中的mock数据
  static getInsistMockData() async {
    return Future.value(mockInsistLists);
  }

  static getBannerMockData() async {
    return Future.value(mockBannerList);
  }

  static getInsistData() async {
    final insistURL = "/api/v1/home";
    final result = await HttpRequest.request(insistURL);
    final data = result["data"];

    List<SNPInsistModel> insistList = [];
    for (var plan in data) {
      insistList.add(SNPInsistModel.fromJson(plan));
    }
    return Future.value(insistList);
  }

  static addInsistData(SNPInsistModel insistData) async {
    final insistURL = "/api/v1/home/add";
    Map<String, dynamic> param = insistData.toJson();
    final result =
        await HttpRequest.request(insistURL, method: "POST", params: param);
    // final data = result["data"];
    // if (data == null) {
    //   var err = DioError();
    //   return Future.error(err);
    // }
    return result;
  }

  static updateInsistData(SNPInsistModel insistData) async {
    final insistURL = "/api/v1/home/update";
    Map<String, dynamic> param = insistData.toJson();
    final result =
        await HttpRequest.request(insistURL, method: "POST", params: param);
    return result;
  }

  static delInsistData(SNPInsistModel insistData) async {
    final insistURL = "/api/v1/home/delete";
    Map<String, dynamic> param = insistData.toJson();
    final result =
        await HttpRequest.request(insistURL, method: "POST", params: param);
    return result;
  }
}
