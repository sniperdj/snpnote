import 'package:flutter/material.dart';
import 'package:snpnote/core/model/home/snp_insist_model.dart';
import 'package:snpnote/core/viewmodel/home/snp_home_view_model.dart';

class SNPHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: homeData(),
    );
  }

  Widget homeData() {
    return Column(
      children: <Widget>[bannerWidget(), insistWidget()],
    );
  }

  Widget bannerWidget() {
    return Container(
      height: 240,
      child: GridView.builder(
        itemCount: 3,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('title : $index'),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget insistWidget() {
    return FutureBuilder(
        future: SNPHomeViewModel.getMockData(),
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          final List<SNPInsistModel> insistItems = snapshot.data;
          if (!snapshot.hasData) {
            // loading中
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.error != null) {
            // 报错了
            return Center(
              child: Text('request data error'),
            );
          }
          return Container(
            child: Expanded(
              child: ListView.builder(
                  itemCount: insistItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${insistItems[index].insistName}'),
                    );
                  }),
            ),
          );
        });
  }
}
