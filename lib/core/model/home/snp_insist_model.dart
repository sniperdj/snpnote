import 'package:flutter/material.dart';
import 'dart:convert';

class SNPInsistModel {
  // String id;
  String insistName;
  String insistDays;
  String detailInfo;
  String insistUser;
  String startDate;

  SNPInsistModel(
      {this.insistName,
      this.insistDays,
      this.detailInfo,
      this.insistUser,
      this.startDate});

  String hyMealModelToJson(SNPInsistModel data) => json.encode(data.toJson());

  factory SNPInsistModel.fromJson(Map<String, dynamic> json) => SNPInsistModel(
        // id: json["id"],
        insistName: json["insist_name"],
        insistDays: json["insist_days"],
        detailInfo: json["detail_info"],
        insistUser: json["insist_user"],
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "insist_name": insistName,
        "insist_days": insistDays,
        "detail_info": detailInfo,
        "insist_user": insistUser,
      };
}
