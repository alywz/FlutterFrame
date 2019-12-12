import 'package:douban_app/pages/appbars/homepage_appbar.dart';
import 'package:douban_app/pages/drawer_pager.dart';
import 'package:flutter/material.dart';

import 'components/smartdrawer.dart';
import 'components/tabbar_item.dart';
import 'pages/home_page.dart';
import 'pages/mine_page.dart';
import 'pages/second_page.dart';
import 'pages/third_page.dart';

void main() => runApp(MyApp());

///App 启动容器
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "Home Page",
      theme: ThemeData(
        primaryColor: Colors.yellow,
//        highlightColor: Colors.transparent,
////        splashColor: Colors.transparent,
      ),
      home: HomeContent(),
    );
  }
}

///视图容器
class HomeContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeContentState();
  }
}

///视图容器状态
class HomeContentState extends State<HomeContent> {
  int _currentIndex = 0;
  final List<Widget> homePages = [];
  final List<AlyBottomBarItem> tabbarItems = [];

  PageController pageControler = PageController(keepPage: false);

  final List<AppBar> _appbars = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("初始化");
    homePages.add(HomePage());
    homePages.add(SecondPage());
    homePages.add(ThirdPage());
    homePages.add(MinePage());
    tabbarItems.add(AlyBottomBarItem("首页", "home"));
    tabbarItems.add(AlyBottomBarItem("智能", "smart"));
    tabbarItems.add(AlyBottomBarItem("统计", "statistics"));
    tabbarItems.add(AlyBottomBarItem("我的", "my"));
    _appbars.add(gethomeappbar());
    _appbars.add(getsecondappbar());
    _appbars.add(getthirdappbar());
    _appbars.add(getmineappbar());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbars[_currentIndex],
      body: PageView(
        controller: pageControler,
        children: homePages,
//        physics: NeverScrollableScrollPhysics(),
        onPageChanged: ((index) {
          setState(() {
            _currentIndex = index;
          });
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 2,
        currentIndex: _currentIndex,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black38,
        type: BottomNavigationBarType.fixed,
        items: tabbarItems,
        onTap: (index) {
          pageControler.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      drawer:MyDrawer()
    );
  }



  AppBar gethomeappbar() {
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

  AppBar getsecondappbar() {
    return AppBar(
      title: Text(
        "有圈",
        style: TextStyle(fontSize: 17),
      ),
      centerTitle: true,
    );
  }

  AppBar getthirdappbar() {
    return AppBar(
      title: Text(
        "更多",
        style: TextStyle(fontSize: 17),
      ),
      centerTitle: true,
    );
  }

  AppBar getmineappbar() {
    return AppBar(
      title: Text(
        "我的",
        style: TextStyle(fontSize: 17),
      ),
      centerTitle: true,
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
