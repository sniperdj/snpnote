import 'package:flutter/material.dart';

class SNPSysDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  // 弹出对话框
  static Future<bool> showMyDialog(BuildContext context, String msg,
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

  static Future<bool> showSelectDialog(BuildContext context, String msg,
      {String title = "提示"}) {
    final result = showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
                child: Text("取消"),
                onPressed: () {
                  Navigator.of(context).pop(false); // 关闭对话框
                }),
            FlatButton(
                child: Text("确定"),
                onPressed: () {
                  Navigator.of(context).pop(true);
                } // 确定对话框
                ),
          ],
        );
      },
    );

    return Future.value(result);
  }
}
