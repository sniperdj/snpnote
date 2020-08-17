import 'package:flutter/material.dart';
import 'package:snpnote/core/model/home/snp_insist_model.dart';
import 'package:table_calendar/table_calendar.dart';

class SNPInsistDetailScreen extends StatefulWidget {
  static const String routeName = "/insistdetail";

  @override
  _SNPInsistDetailScreenState createState() => _SNPInsistDetailScreenState();
}

class _SNPInsistDetailScreenState extends State<SNPInsistDetailScreen> {
  final _calendarC = CalendarController();

  @override
  Widget build(BuildContext context) {
    SNPInsistModel _detail = ModalRoute.of(context).settings.arguments;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('详情'),
      ),
      body: Column(
        children: <Widget>[
          calendarSection(),
          titleSection(_detail),
          contentSection(_detail, width - 40),
          buttonSection()
        ],
      ),
    );
  }

  Widget calendarSection() {
    return TableCalendar(calendarController: _calendarC);
  }

  Widget titleSection(SNPInsistModel detail) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text('${detail.insistName}'),
    );
  }

  Widget contentSection(SNPInsistModel detail, double width) {
    return Expanded(
      child: Container(
        width: width,
        padding: EdgeInsets.all(8),
        color: Colors.white,
        child: Text('${detail.detailInfo}'),
      ),
    );
  }

  Widget buttonSection() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: RaisedButton(child: Text('确定'), onPressed: () {}),
    );
  }
}
