import 'package:flutter/material.dart';

import 'tabbar_item.dart';

///底部导航栏
class AlyBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final PageController pageControler;

  const AlyBottomNavigationBar({Key key, this.currentIndex, this.pageControler})
      : super(key: key);

  @override
  _AlyBottomNavigationBarState createState() => _AlyBottomNavigationBarState();
}

class _AlyBottomNavigationBarState extends State<AlyBottomNavigationBar> {
  final List<AlyBottomBarItem> tabbarItems = [];

  @override
  void initState() {
    super.initState();
    tabbarItems.add(AlyBottomBarItem("首页", "home"));
    tabbarItems.add(AlyBottomBarItem("智能", "smart"));
    tabbarItems.add(AlyBottomBarItem("统计", "statistics"));
    tabbarItems.add(AlyBottomBarItem("我的", "my"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 2,
        currentIndex: widget.currentIndex,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black38,
        type: BottomNavigationBarType.fixed,
        items: tabbarItems,
        onTap: (index) {
          widget.pageControler.jumpToPage(index);
        },
      ),
    );
  }
}
