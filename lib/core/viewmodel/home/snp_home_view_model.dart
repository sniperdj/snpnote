import 'package:flutter/material.dart';
import 'package:snpnote/ui/pages/home/mock_home.dart';

class SNPHomeViewModel extends ChangeNotifier {
  // 获取首页cell中的mock数据
  static getMockData() async {
    return Future.value(mockInsistLists);
  }
}
