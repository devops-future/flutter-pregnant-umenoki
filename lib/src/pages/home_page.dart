///
/// Project name : Umenoki
/// Description : Home page
/// Author : Xiao
/// Date : 2020-06-02
///

import 'package:flutter/material.dart';
import 'package:umenoki/src/app_theme.dart';
import 'package:umenoki/src/app_global.dart';
class HomePage extends StatefulWidget {
  HomePage({
    Key key,
    this.selPage,
    this.selIndex,
  }) : super(key: key);

  final String selPage;
  final int selIndex;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scakey = new GlobalKey<_HomePageState>();
  String _selPage = '';
  int _selIndex = -1;

  void onTabTapped(int index) {
    setState(() {
      _selIndex = index;
      switch (index) {
        case 0:
          _selPage = 'mybaby';
          break;
        case 1:
          _selPage = 'me';
          break;
        case 2:
          _selPage = 'nutrition';
          break;
        case 3:
          _selPage = 'journey';
          break;
        case 4:
          _selPage = 'health';
          break;
      }
    });
  }

  void initState() {
    super.initState();
    _selPage = widget.selPage;
    _selIndex = widget.selIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scakey,
      body: Center(
        child: AppGlobal.widgetOptions[_selPage],
      ),

      bottomNavigationBar: bottomNavBar(),
    );
  }

  Widget bottomNavBar() {
    return BottomNavigationBar(
      onTap: onTabTapped,
      currentIndex: _selIndex,
      showUnselectedLabels: true,
      backgroundColor: AppTheme.nearlyPink,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: AppTheme.nearlyDarkRed,
      unselectedFontSize: 14.0,
      items: AppGlobal.navItems,
    );
  }
}
