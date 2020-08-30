import 'package:flutter/material.dart';

class SNPMyScreen extends StatelessWidget {
  final List<String> settingItemList = ["坚持最长天数", "坚持最长项目", "实现的梦想数", "设置"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('我的'),
        ),
        body: bodySection());
  }

  Widget bodySection() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Color.fromARGB(240, 240, 240, 240),
      child: ListView.separated(
          itemBuilder: (ctx, index) {
            return Container(
              color: Colors.white,
              child: ListTile(
                title: Text(settingItemList[index]),
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            if (index != 2) {
              return Divider(
                color: Color.fromARGB(240, 240, 240, 240),
              );
            } else {
              return Divider(
                thickness: 40,
                height: 40,
                color: Color.fromARGB(240, 240, 240, 240),
              );
            }
          },
          itemCount: settingItemList.length),
    );
  }
}

// ListView.builder(
//         itemCount: 4,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(settingItemList[index]),
//           );
//         },
//       )
