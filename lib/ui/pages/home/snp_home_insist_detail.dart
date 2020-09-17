import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:snpnote/core/model/home/snp_insist_model.dart';
import 'package:snpnote/core/viewmodel/home/snp_home_view_model.dart';
import 'package:snpnote/core/view/snp_sys_dialog.dart';

class SNPInsistDetailScreen extends StatefulWidget {
  static const String routeName = "/insistdetail";

  @override
  _SNPInsistDetailScreenState createState() => _SNPInsistDetailScreenState();
}

class _SNPInsistDetailScreenState extends State<SNPInsistDetailScreen> {
  final _calendarC = CalendarController();
  final _titleC = TextEditingController();
  final _contentC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SNPInsistModel _detail = ModalRoute.of(context).settings.arguments;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    _titleC.text = _detail.insistName;
    _contentC.text = _detail.detailInfo;
    return Scaffold(
      appBar: AppBar(
        title: Text('详情'),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: height),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              calendarSection(),
              titleSection(_detail),
              contentSection(_detail, width - 40),
              buttonSection(_detail)
            ],
          ),
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget calendarSection() {
    return TableCalendar(calendarController: _calendarC);
  }

  Widget titleSection(SNPInsistModel detail) {
    return Container(
      padding: EdgeInsets.all(8),
      // child: Text('${detail.insistName}'),
      child: TextField(
        decoration:
            InputDecoration(hintText: '请填入标题', border: InputBorder.none),
        controller: _titleC,
        onChanged: (strValue) {
          setState(() {
            print("title str value is ${strValue}");
            detail.insistName = strValue;
            // _titleC.text = strValue;
          });
        },
      ),
    );
  }

  Widget contentSection(SNPInsistModel detail, double width) {
    return Expanded(
      child: Container(
        width: width,
        padding: EdgeInsets.all(8),
        color: Colors.white,
        // child: Text('${detail.detailInfo}'),
        child: TextField(
          decoration:
              InputDecoration(hintText: '请填入内容', border: InputBorder.none),
          controller: _contentC,
          onChanged: (strValue) {
            setState(() {
              print("content str value is ${strValue}");
              detail.detailInfo = strValue;
            });
          },
        ),
      ),
    );
  }

  Widget buttonSection(SNPInsistModel detail) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: RaisedButton(
          child: Text('确定'),
          onPressed: () {
            print("123 que ding");
            if (_titleC.text.length <= 0) {
              print("title null resultsdfsdf");
              SNPSysDialog.showMyDialog(context, "标题不能为空");
              return;
            }
            if (_contentC.text.length <= 0) {
              SNPSysDialog.showMyDialog(context, "内容不能为空");
              return;
            }
            detail.insistName = _titleC.text;
            detail.detailInfo = _contentC.text;
            final result = SNPHomeViewModel.updateInsistData(detail);
            result.then((data) {
              print("update success");
              Navigator.of(context).pop();
            }).catchError((error) {
              DioError err = error;
              // String errCode = "${err.response.statusCode}";
              String errMsg = err.error.toString();
              SNPSysDialog.showMyDialog(context, errMsg);
            });
          }),
    );
  }
}
