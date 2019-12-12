import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homepages/right_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int num = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("首页初始化了");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Container(
          child: Text(
            "计数器$num",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              num++;
              if (num > 2) {
//                Navigator.of(context,rootNavigator: false).push(CupertinoPageRoute(builder: (context) {return RightPage();}));
                Navigator.pushNamed(context, "/rightpage", arguments: "传递的参数")
                    .then((value) {
                  print(value);
                });
//              Future result= Navigator.pushNamed(context, "/rightpage",arguments: "传递的参数");
//              if(result!=null){
//                result.then((value){
//                  print("哈哈哈$value");
//                });
//              }
              }
            });
          }),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
