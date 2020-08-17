import 'package:flutter/material.dart';

class SNPDiaryModel {
  String id;
  String diaryType;
  String diaryContent;
  String date;
  String diaryImgUrl;

  SNPDiaryModel(
      {this.id,
      this.diaryType,
      this.diaryContent,
      this.date,
      this.diaryImgUrl});
}
