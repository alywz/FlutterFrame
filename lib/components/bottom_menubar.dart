import 'package:douban_app/pages/drawer_pager.dart';
import 'package:douban_app/pages/home_page.dart';
import 'package:douban_app/pages/mine_page.dart';
import 'package:douban_app/pages/second_page.dart';
import 'package:douban_app/pages/third_page.dart';
import 'package:flutter/material.dart';

///有状态StatefulWidget
///继承于 StatefulWidget，通过 State 的 build 方法去构建控件
class BotomeMenumBarPage extends StatefulWidget {
  ////通过构造方法传值
  BotomeMenumBarPage();

  //主要是负责创建state
  @override
  BotomeMenumBarPageState createState() => BotomeMenumBarPageState();
}

///在 State 中,可以动态改变数据
///在 setState 之后，改变的数据会触发 Widget 重新构建刷新
class BotomeMenumBarPageState extends State<BotomeMenumBarPage> {
  BotomeMenumBarPageState();

  final PageController _pageControler = PageController(keepPage: false);
  final List<Widget> _homePages = [];
  final List<AppBar> _appbars = [];

  //当前显示页面的
  int _currentIndex = 0;

  @override
  void initState() {
    ///初始化，这个函数在生命周期中只调用一次
    super.initState();
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
    //构建页面
    return buildBottomTabScaffold();
  }

  ///构建页面
  Widget buildBottomTabScaffold() {
    return Container(
        child: Scaffold(
            appBar: _appbars[_currentIndex],
            //对应的页面
            body: getPageView(),
            //悬浮按钮的位置
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            //悬浮按钮
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.yellow,
              child: const Icon(Icons.add, color: Colors.black),
              onPressed: () {
                print("add press ");
                Navigator.pushNamed(context, "/nestscrollviewpage", arguments: "传递的参数")
                    .then((value) {
                  print(value);
                });
              },
            ),
            //其他菜单栏
            bottomNavigationBar: BottomAppBar(
              //悬浮按钮 与其他菜单栏的结合方式
              shape: CircularNotchedRectangle(),
              // FloatingActionButton和BottomAppBar 之间的差距
              notchMargin: 3.0,
              color: Colors.white,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  buildBotomItem(_currentIndex, 0, Icons.home, "首页"),
                  buildBotomItem(_currentIndex, 1, Icons.library_music, "发现"),
                  buildBotomItem(_currentIndex, -1, null, null),
                  buildBotomItem(_currentIndex, 2, Icons.email, "消息"),
                  buildBotomItem(_currentIndex, 3, Icons.person, "我的"),
                ],
              ),
            ),
            drawer: MyDrawer()));
  }

  //body PageView部分
  PageView getPageView() {
    return PageView(
      controller: _pageControler,
      children: _homePages,
      //禁止滑动
//      physics: NeverScrollableScrollPhysics(),
      //带弹性的滑动
//      physics: BouncingScrollPhysics(),
      //默认的滑动
      physics: AlwaysScrollableScrollPhysics(),
      onPageChanged: ((index) {
        setState(() {
          _currentIndex = index;
        });
      }),
    );
  }

// ignore: slash_for_doc_comments
  /**
   * @param selectIndex 当前选中的页面
   * @param index 每个条目对应的角标
   * @param iconData 每个条目对就的图标
   * @param title 每个条目对应的标题
   */
  buildBotomItem(int selectIndex, int index, IconData iconData, String title) {
    //未选中状态的样式
    TextStyle textStyle = TextStyle(fontSize: 11.0, color: Colors.grey);
    Color iconColor = Colors.grey;
    double iconSize = 24;
    EdgeInsetsGeometry padding = EdgeInsets.only(top: 7.0);
    if (selectIndex == index) {
      //选中状态的文字样式
      textStyle = TextStyle(fontSize: 11.0, color: Colors.black);
      //选中状态的按钮样式
      iconColor = Colors.black;
      iconSize = 24;
      padding = EdgeInsets.only(top: 7.0);
    }
    Widget padItem = SizedBox();
    if (iconData != null) {
      padItem = Padding(
        padding: padding,
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              children: <Widget>[
                Icon(
                  iconData,
                  color: iconColor,
                  size: iconSize,
                ),
                Text(
                  title,
                  style: textStyle,
                )
              ],
            ),
          ),
        ),
      );
    }
    Widget item = Expanded(
      flex: 1,
      child: new GestureDetector(
        onTap: () {
          if (index != _currentIndex) {
            setState(() {
              _currentIndex = index;
              _pageControler.jumpToPage(_currentIndex);
            });
          }
        },
        child: SizedBox(
          height: 52,
          child: padItem,
        ),
      ),
    );
    return item;
  }
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
