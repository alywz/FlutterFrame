import 'package:flutter/material.dart';

///Aly 自定义 BottomNavigationBarItem底部的item
class AlyBottomBarItem extends BottomNavigationBarItem {
  AlyBottomBarItem(String title, String iconname)
      : super(
          title: Text(title,style: TextStyle(fontSize: 12),),
          icon: Image.asset("assets/images/${iconname}.png"),
          activeIcon: Image.asset("assets/images/${iconname}_select.png"),
        );
}


///Aly 自定义 TabBar 的 Tab 底部的item
class AlyTabItem extends Tab {
  AlyTabItem(String title, String iconname)
      : super(
    text: title,
    icon: Image.asset("assets/images/${iconname}.png"),
  );
}

