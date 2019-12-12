import 'package:douban_app/components/smartdrawer.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlySmartDrawer(
        widthPercent: 0.7,
        callback: (bool) {
          if (bool) {
            print("抽屉打开了");
          } else {
            print("抽屉关闭了");
          }
        },
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "http://pic1.win4000.com/wallpaper/2018-01-25/5a699c89baaea.jpg"))),
              child: Center(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          "http://pic1.win4000.com/pic/6/0c/22a78967fe_250_350.jpg"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "我是Aly",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}







