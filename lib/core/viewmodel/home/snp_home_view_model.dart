import 'package:flutter/material.dart';
import 'package:snpnote/ui/pages/home/mock_home.dart';

class SNPHomeViewModel extends ChangeNotifier {
  // 获取首页cell中的mock数据
  static getInsistMockData() async {
    return Future.value(mockInsistLists);
  }

  static getBannerMockData() async {
    return Future.value(mockBannerList);
  }
}
