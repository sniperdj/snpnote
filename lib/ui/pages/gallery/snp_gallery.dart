import 'package:flutter/material.dart';

class SNPGalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('梦想相册'),
      ),
      body: gridSection(),
    );
  }

  Widget gridSection() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
        itemBuilder: (context, index) {
          return getCellItem();
        });
  }

  Widget getCellItem() {
    return Container(
      color: Colors.orange,
      child: Column(
        children: <Widget>[
          Image.network(
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597684051750&di=1eef107195f850e761412fcd0c0eeb87&imgtype=0&src=http%3A%2F%2Fimg.mp.sohu.com%2Fupload%2F20170520%2Fdd98cafe695546638ea9b72d6cbb694e_th.png"),
          Text(
            '保时捷',
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
