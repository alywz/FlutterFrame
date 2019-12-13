import 'package:douban_app/routes/myroutes.dart';
import 'package:flutter/material.dart';

import 'components/bottom_menubar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: '/',
      //配置默认访问路径
      onGenerateRoute: onGenerateRoute,
      //必须加上这一行，固定写法
      title: "MaterialApp",
      theme: ThemeData(
        primaryColor: Colors.yellow,
      ),
      home: BotomeMenumBarPage(),
//        routes: myroutes,
    );
  }
}


