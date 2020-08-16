import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:snpnote/core/model/home/snp_banner_model.dart';
import 'package:snpnote/core/model/home/snp_insist_model.dart';
import 'package:snpnote/core/viewmodel/home/snp_home_view_model.dart';
import 'package:snpnote/ui/pages/home/snp_home_insist_detail.dart';

class SNPHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('首页'),
        ),
        body: homeData());
  }

  Widget homeData() {
    return Column(
      children: <Widget>[bannerWidget(), insistWidget()],
    );
  }

  // 轮播图
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

  // 列表
  Widget insistWidget() {
    return FutureBuilder(
        future: SNPHomeViewModel.getInsistMockData(),
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
                    return ListTile(
                      title: Text('${insistItem.insistName}'),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            SNPInsistDetail.routeName,
                            arguments: insistItem);
                      },
                    );
                  }),
            ),
          );
        });
  }
}
