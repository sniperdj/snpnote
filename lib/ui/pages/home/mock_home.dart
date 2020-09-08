import 'package:flutter/material.dart';
import 'package:snpnote/core/model/home/snp_insist_model.dart';
import 'package:snpnote/core/model/home/snp_banner_model.dart';

final List<SNPInsistModel> mockInsistLists = [
  SNPInsistModel(
      insistName: "我要戒酒",
      insistDays: "3",
      detailInfo: "从今天开始,少喝酒,少喝酒,少喝酒,不是完全不喝哈"),
  SNPInsistModel(
      insistName: "我要减肥", insistDays: "1", detailInfo: "从今天开始,运动,运动,运动,注意饮食哈"),
  SNPInsistModel(
      insistName: "我要背英语单词", insistDays: "5", detailInfo: "从今天开始,积少成多,坚持哈"),
];

final List<SNPBannerModel> mockBannerList = [
  SNPBannerModel(id: "0", url: "lib/mock_assets/banner0.jpeg"),
  SNPBannerModel(id: "1", url: "lib/mock_assets/banner1.jpeg"),
  SNPBannerModel(id: "2", url: "lib/mock_assets/banner2.jpeg"),
  SNPBannerModel(id: "3", url: "lib/mock_assets/banner3.jpeg"),
];
