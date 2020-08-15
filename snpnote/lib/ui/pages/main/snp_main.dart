import 'package:flutter/material.dart';
import 'package:snpnote/ui/pages/main/snp_init_items.dart';
// import 'package:snpnote/ui/pages/main/snp_init_items.dart';

class SNPMainScreen extends StatefulWidget {
  @override
  _SNPMainScreenState createState() => _SNPMainScreenState();
}

class _SNPMainScreenState extends State<SNPMainScreen> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: naviBarItems,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
