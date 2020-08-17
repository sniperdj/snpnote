import 'package:flutter/material.dart';
import 'package:snpnote/core/model/diary/snp_diary_model.dart';
import 'package:snpnote/core/viewmodel/diary/snp_diary_view_model.dart';
import 'package:snpnote/ui/pages/diary/snp_diary_detail.dart';

class SNPDiaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('成功日记'),
      ),
      body: diarySection(),
    );
  }

  Widget diarySection() {
    return FutureBuilder(
        future: SNPDiaryViewModel.getDiaryMockData(),
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          final List<SNPDiaryModel> diaryItems = snapshot.data;

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.error != null) {
            return Center(
              child: Text('request data error'),
            );
          }

          return Container(
            child: ListView.builder(
                itemCount: diaryItems.length,
                itemBuilder: (ctx, index) {
                  SNPDiaryModel diary = diaryItems[index];
                  if (diary.diaryImgUrl == null) {
                    return ListTile(
                      title: Text('${diary.diaryType}'),
                      subtitle: Text('${diary.diaryContent}'),
                      onTap: () {
                        Navigator.of(ctx).pushNamed(
                            SNPDiaryDetailScreen.routeName,
                            arguments: diary);
                      },
                    );
                  }
                  return ListTile(
                    leading: Image.asset(
                      diary.diaryImgUrl,
                      fit: BoxFit.fill,
                    ),
                    title: Text('${diary.diaryType}'),
                    subtitle: Text('${diary.diaryContent}'),
                    onTap: () {
                      Navigator.of(ctx).pushNamed(
                          SNPDiaryDetailScreen.routeName,
                          arguments: diary);
                    },
                  );
                }),
          );
        });
  }
}
