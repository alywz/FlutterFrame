import 'package:flutter/material.dart';

class HomePageAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(icon: Icon(Icons.menu), onPressed: _homeMenuPress),
      title: Text("首页", style: TextStyle(fontSize: 17)),
      centerTitle: true,
      actions: <Widget>[
        IconButton(icon: Icon(Icons.search), onPressed: _hometitlePress)
      ],
    );
  }

  //  首页右上角搜索按钮
  void _hometitlePress() {
    print("点击了搜索");
  }

//首页菜单按钮
  void _homeMenuPress() {
    print("点击了菜单");
  }
}
