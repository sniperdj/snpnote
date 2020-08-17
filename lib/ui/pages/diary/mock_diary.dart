import 'package:flutter/material.dart';
import 'package:snpnote/core/model/diary/snp_diary_model.dart';

final List<SNPDiaryModel> mockDiaryList = [
  SNPDiaryModel(
      id: "0",
      diaryType: "理财",
      diaryContent: "投资基金之后,第一次赚这么多,3个基金加起来一天赚220多",
      date: "2020-07-01"),
  SNPDiaryModel(
      id: "0",
      diaryType: "理财",
      diaryContent: "一天跌了80多,很淡定",
      date: "2020-07-02"),
  SNPDiaryModel(
      id: "0",
      diaryType: "进步",
      diaryContent: "中午很困的情况下还是坚持学习了",
      date: "2020-07-06"),
  SNPDiaryModel(
      id: "0",
      diaryType: "进步",
      diaryContent: "拖延症-洗鞋, 拖延了好久,今天终于完成了",
      date: "2020-07-12",
      diaryImgUrl: "lib/mock_assets/diary0.webp"),
];
