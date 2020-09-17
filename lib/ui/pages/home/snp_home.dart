import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:dio/dio.dart';

import 'package:snpnote/core/model/home/snp_banner_model.dart';
import 'package:snpnote/core/model/home/snp_insist_model.dart';
import 'package:snpnote/core/viewmodel/home/snp_home_view_model.dart';
import 'package:snpnote/ui/pages/home/snp_home_add.dart';
import 'package:snpnote/ui/pages/home/snp_home_insist_detail.dart';
import 'package:snpnote/core/view/snp_sys_dialog.dart';

class SNPHomeScreen extends StatefulWidget {
  @override
  _SNPHomeScreenState createState() => _SNPHomeScreenState();
}

class _SNPHomeScreenState extends State<SNPHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: homeData(),
      floatingActionButton: FloatingActionButton(
          tooltip: "add",
          child: Icon(Icons.add),
          onPressed: () {
            // print("floating action btn clicked");
            Navigator.of(context).pushNamed(SNPHomeAddScreen.routeName);
          }),
    );
  }

  Widget homeData() {
    return Container(
      color: Color.fromARGB(240, 240, 240, 240),
      child: Column(
        // children: <Widget>[bannerWidget(), insistWidget()],
        children: <Widget>[insistWidget()],
      ),
    );
  }

  Widget bannerWidget() {
    return FutureBuilder(
        future: SNPHomeViewModel.getBannerMockData(),
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          final List<SNPBannerModel> bannerItems = snapshot.data;
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
            height: 400,
            child: Swiper(
              // autoplay: true,
              itemCount: bannerItems.length,
              itemBuilder: (context, index) {
                final SNPBannerModel bannerItem = bannerItems[index];
                return Image.asset(
                  bannerItem.url,
                  fit: BoxFit.fill,
                );
              },
            ),
          );
        });
  }

  Widget insistWidget() {
    return FutureBuilder(
        future: SNPHomeViewModel.getInsistData(),
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
                    final SNPInsistModel insistItem = insistItems[index];
                    return myContainder(context, insistItem);
                  }),
            ),
          );
        });
  }

  Widget myContainder(BuildContext context, SNPInsistModel insistItem) {
    return Container(
      color: Colors.white,
      child: ListTile(
        title: Text('${insistItem.insistName}'),
        onTap: () {
          Navigator.of(context).pushNamed(SNPInsistDetailScreen.routeName,
              arguments: insistItem);
        },
        onLongPress: () async {
          final result =
              await SNPSysDialog.showSelectDialog(context, "是否需要删除该计划?");
          print("result is : ${result}");
          if (result) {
            final res = SNPHomeViewModel.delInsistData(insistItem);
            res.then((data) {
              print("data : ${data}");
              setState(() {});
            }).catchError((error) {
              DioError err = error;
              // String errCode = "${err.response.statusCode}";
              String errMsg = err.error.toString();
              SNPSysDialog.showMyDialog(context, errMsg);
            });
          }
        },
      ),
    );
  }
}
