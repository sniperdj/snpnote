import 'package:flutter/material.dart';
import 'package:snpnote/core/model/home/snp_insist_model.dart';

class SNPDiaryAddScreen extends StatelessWidget {
  static const String routeName = "/diaryadd";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('日记'),
      ),
      body: Column(
        children: <Widget>[titleSection(), contentSection(), okBtnSection()],
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget titleSection() {
    return Container(
      padding: EdgeInsets.all(8),
      child: TextField(
          keyboardType: TextInputType.text,
          keyboardAppearance: Brightness.light,
          decoration: InputDecoration(
              hintText: '请输入要编辑的title',
              border: OutlineInputBorder(borderSide: BorderSide()))),
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
        });
  }
}
