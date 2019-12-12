import 'package:douban_app/pages/homepages/right_page.dart';
import 'package:flutter/material.dart';
//引入文件

//配置路由规则
final myroutes = {
  //Map<String, WidgetBuilder>
  "/rightpage": (context,{arguments}) => RightPage(arguments:arguments),
//  "/home": (context) => HomePage(),
//  "/login": (context) => LoginPage(),
//  "/mine": (context) => MinePage(),
//  "/bank": (context) => BankCardPage(),
//  "/card": (context) => CardSubmit(),
//  "/kefu": (context) => ContactKefu(),
//  "/order": (context) => OrderPage(),
//  "/evaluation": (context) => Edevaluation(),
//  "/wallet": (context) => Wallet(),
//  '/pagetest': (context,{arguments}) => PageTest(arguments:arguments),  //通过这种方式可以配置传递参数
};

// 如果你要把路由抽离出去，必须写下面这一堆的代码，不用理解什么意思
// ignore: top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings){
  // 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = myroutes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
