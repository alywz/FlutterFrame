import 'package:douban_app/pages/drawer_pager.dart';
import 'package:flutter/material.dart';

import 'components/bottom_navigationbar.dart';
import 'pages/home_page.dart';
import 'pages/mine_page.dart';
import 'pages/second_page.dart';
import 'pages/third_page.dart';
import 'routes/myroutes.dart';

void main() => runApp(MyApp());

///App 启动容器
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: '/',//配置默认访问路径
      onGenerateRoute: onGenerateRoute,//必须加上这一行，固定写法
      title: "MaterialApp",
      theme: ThemeData(
        primaryColor: Colors.yellow,
      ),
      home: HomeContent(),
//        routes: myroutes,
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
  final List<Widget> _homePages = [];
  final PageController _pageControler = PageController(keepPage: false);

  final List<AppBar> _appbars = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("初始化");
    _homePages.add(HomePage());
    _homePages.add(SecondPage());
    _homePages.add(ThirdPage());
    _homePages.add(MinePage());
    _appbars.add(gethomeappbar());
    _appbars.add(getsecondappbar());
    _appbars.add(getthirdappbar());
    _appbars.add(getmineappbar());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appbars[_currentIndex],
        body: getPageView(),
        bottomNavigationBar: AlyBottomNavigationBar(
            currentIndex: _currentIndex, pageControler: _pageControler),
        drawer: MyDrawer());
  }

  //body PageView部分
  PageView getPageView() {
    return PageView(
      controller: _pageControler,
      children: _homePages,
      onPageChanged: ((index) {
        setState(() {
          _currentIndex = index;
        });
      }),
    );
  }

  //首页的Appbar
  AppBar gethomeappbar() {
    return AppBar(
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            });
      }),
      title: Text("首页", style: TextStyle(fontSize: 17)),
      centerTitle: true,
      actions: <Widget>[
        IconButton(icon: Icon(Icons.search), onPressed: () => print("搜索"))
      ],
    );
  }

  //有圈的Appbar
  AppBar getsecondappbar() {
    return AppBar(
      leading: Icon(null),
      title: Text(
        "有圈",
        style: TextStyle(fontSize: 17),
      ),
      centerTitle: true,
    );
  }

  //更多的Appbar
  AppBar getthirdappbar() {
    return AppBar(
      leading: Icon(null),
      title: Text(
        "更多",
        style: TextStyle(fontSize: 17),
      ),
      centerTitle: true,
    );
  }

  //我的Appbar
  AppBar getmineappbar() {
    return AppBar(
      leading: Icon(null),
      title: Text(
        "我的",
        style: TextStyle(fontSize: 17),
      ),
      centerTitle: true,
    );
  }
}
