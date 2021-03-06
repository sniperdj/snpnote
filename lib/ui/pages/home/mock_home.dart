import 'package:flutter/material.dart';
import 'package:snpnote/core/model/home/snp_insist_model.dart';
import 'package:snpnote/core/model/home/snp_banner_model.dart';

final List<SNPInsistModel> mockInsistLists = [
  SNPInsistModel(id: "0", insistName: "我要戒酒", insistDays: "3"),
  SNPInsistModel(id: "1", insistName: "我要减肥", insistDays: "1"),
  SNPInsistModel(id: "1", insistName: "我要背英语单词", insistDays: "5"),
];

final List<SNPBannerModel> mockBannerList = [
  SNPBannerModel(id: "0", url: "lib/mock_assets/banner0.jpeg"),
  SNPBannerModel(id: "1", url: "lib/mock_assets/banner1.jpeg"),
  SNPBannerModel(id: "2", url: "lib/mock_assets/banner2.jpeg"),
  SNPBannerModel(id: "3", url: "lib/mock_assets/banner3.jpeg"),
];
