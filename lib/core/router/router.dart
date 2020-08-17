import 'package:flutter/material.dart';
import 'package:snpnote/ui/pages/home/snp_home_insist_detail.dart';
import 'package:snpnote/ui/pages/diary/snp_diary_detail.dart';

class SNPRouter {
  // static final String initialRoute = HYMainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    SNPInsistDetailScreen.routeName: (ctx) => SNPInsistDetailScreen(),
    SNPDiaryDetailScreen.routeName: (ctx) => SNPDiaryDetailScreen(),
  };

  // 自己扩展
  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}
