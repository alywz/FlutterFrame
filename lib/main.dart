import 'dart:io';

import 'package:douban_app/routes/myroutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/bottom_menubar.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle style = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        ///这是设置状态栏的图标和字体的颜色
        ///Brightness.light  一般都是显示为白色
        ///Brightness.dark 一般都是显示为黑色
        statusBarIconBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      //配置默认访问路径
      onGenerateRoute: onGenerateRoute,
      //必须加上这一行，固定写法
      title: "MaterialApp",
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: BotomeMenumBarPage(),
//        routes: myroutes,
    );
  }
}
