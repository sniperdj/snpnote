import 'package:flutter/material.dart';

class SNPInsistDetail extends StatelessWidget {
  static const String routeName = "/insistdetail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情'),
      ),
      body: Container(
        child: Center(
          child: Text('insist detail'),
        ),
      ),
    );
  }
}
