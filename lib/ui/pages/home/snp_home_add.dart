import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:snpnote/core/model/home/snp_insist_model.dart';
import 'package:snpnote/core/viewmodel/home/snp_home_view_model.dart';

class SNPHomeAddScreen extends StatelessWidget {
  static const String routeName = "/insistadd";

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('编辑'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            titleSection(),
            contentSection(),
            okBtnSection(context)
          ],
        ),
      ),
    );
  }

  Widget titleSection() {
    return Container(
      color: Colors.red,
      padding: EdgeInsets.all(8),
      child: TextField(
        controller: _titleController,
        decoration:
            InputDecoration(hintText: '请输入要编辑的title', border: InputBorder.none),
      ),
    );
  }

  Widget contentSection() {
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.green,
      width: 400,
      height: 400,
      child: TextField(
        controller: _contentController,
        decoration:
            InputDecoration(hintText: '请填入内容', border: InputBorder.none),
        maxLines: 4,
        onChanged: (String strText) {
          print("change of ${strText}");
        },
      ),
    );
  }

  Widget okBtnSection(BuildContext context) {
    return RaisedButton(
        child: Text('ok'),
        onPressed: () {
          print('ok btn clicked');
          var now = new DateTime.now();
          var date = "${now.year}" + "${now.month}" + "${now.day}";
          if (_titleController.text.length <= 0) {
            print("title null resultsdfsdf");
            showMyDialog(context, "标题不能为空");
            return;
          }
          if (_contentController.text.length <= 0) {
            showMyDialog(context, "内容不能为空");
            return;
          }
          SNPInsistModel insist = SNPInsistModel();
          insist.insistName = _titleController.text;
          insist.insistDays = "1";
          insist.detailInfo = _contentController.text;
          insist.insistUser = "Sniper";
          insist.startDate = date;
          final result = SNPHomeViewModel.addInsistData(insist);
          result.then((data) {
            print("result data : ${data}");
            Navigator.of(context).pop();
          }).catchError((error) {
            DioError err = error;
            // String errCode = "${err.response.statusCode}";
            String errMsg = err.error.toString();
            showMyDialog(context, errMsg);
          });
          // if (result)
        });
  }

  // 弹出对话框
  Future<bool> showMyDialog(BuildContext context, String msg,
      {String title = "提示"}) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
          ],
        );
      },
    );
  }
}
