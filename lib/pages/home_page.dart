import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "计数器$num",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              RaisedButton(
                  child: Text("增加"),
                  onPressed: () {
                    setState(() {
                      num++;
                      if (num > 2) {
                        Navigator.pushNamed(context, "/rightpage",
                            arguments: "传递的参数")
                            .then((value) {
                          print(value);
                        });
                      }
                    });
                  })
            ]),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
