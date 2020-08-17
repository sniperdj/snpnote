import 'package:flutter/material.dart';
import 'package:snpnote/core/model/diary/snp_diary_model.dart';

class SNPDiaryDetailScreen extends StatefulWidget {
  static const String routeName = "/diarydetail";

  @override
  _SNPDiaryDetailScreenState createState() => _SNPDiaryDetailScreenState();
}

class _SNPDiaryDetailScreenState extends State<SNPDiaryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    SNPDiaryModel _detail = ModalRoute.of(context).settings.arguments;
    final width = MediaQuery.of(context).size.width;

    List<Widget> columnList = List();

    if (_detail.diaryImgUrl == null) {
      columnList.add(titleSection(_detail));
      columnList.add(contentSection(_detail, width));
    } else {
      columnList.add(imgSection(_detail, width - 40));
      columnList.add(titleSection(_detail));
      columnList.add(contentSection(_detail, width));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('详情'),
      ),
      body: Column(
        children: columnList,
      ),
    );
  }

  Widget imgSection(SNPDiaryModel detail, double height) {
    return Container(
      height: height,
      child: Image.asset(
        detail.diaryImgUrl,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget titleSection(SNPDiaryModel detail) {
    return Container(
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.centerLeft,
      child: Text('${detail.diaryType}'),
    );
  }

  Widget contentSection(SNPDiaryModel detail, double width) {
    return Expanded(
      child: Container(
        width: width,
        padding: EdgeInsets.all(6.0),
        color: Colors.white,
        child: Text('${detail.diaryContent}'),
      ),
    );
  }
}
