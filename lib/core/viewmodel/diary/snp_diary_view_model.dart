import 'package:flutter/material.dart';
import 'package:snpnote/ui/pages/diary/mock_diary.dart';

class SNPDiaryViewModel extends ChangeNotifier {
  // 获取首页cell中的mock数据
  static getDiaryMockData() async {
    return Future.value(mockDiaryList);
  }
}
