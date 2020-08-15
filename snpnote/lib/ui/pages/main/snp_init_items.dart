import 'package:flutter/material.dart';
import 'package:snpnote/ui/pages/home/snp_home.dart';
import 'package:snpnote/ui/pages/diary/snp_diary.dart';
import 'package:snpnote/ui/pages/gallery/snp_gallery.dart';

final List<Widget> pages = [
  SNPHomeScreen(),
  SNPDiaryScreen(),
  SNPGalleryScreen(),
  SNPHomeScreen()
];

final List<BottomNavigationBarItem> naviBarItems = [
  BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
  BottomNavigationBarItem(icon: Icon(Icons.book), title: Text('日记')),
  BottomNavigationBarItem(icon: Icon(Icons.photo_album), title: Text('相册')),
  BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('我的')),
];
