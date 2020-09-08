import 'package:flutter/material.dart';
import 'package:snpnote/core/model/home/snp_insist_model.dart';
import 'package:snpnote/core/viewmodel/home/snp_home_view_model.dart';

class SNPHomeAddScreen extends StatelessWidget {
  static const String routeName = "/insistadd";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('编辑'),
      ),
      body: Column(
        children: <Widget>[titleSection(), contentSection(), okBtnSection()],
      ),
    );
  }

  Widget titleSection() {
    return Container(
      color: Colors.red,
      padding: EdgeInsets.all(8),
      child: TextField(
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
        decoration:
            InputDecoration(hintText: '请填入内容', border: InputBorder.none),
        maxLines: 4,
      ),
    );
  }

  Widget okBtnSection() {
    return RaisedButton(
        child: Text('ok'),
        onPressed: () {
          print('ok btn clicked');
          SNPInsistModel insist = SNPInsistModel();
          insist.insistName = "添加测试0";
          insist.insistDays = "1";
          insist.detailInfo = "这是一条测试数据, 写死在okbtn的";
          insist.insistUser = "Sniper";
          insist.startDate = "20200908";
          final result = SNPHomeViewModel.postInsistData(insist);
          print(result);
        });
  }
}
