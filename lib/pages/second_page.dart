import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget{
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with AutomaticKeepAliveClientMixin{
  @override
  void initState() {
    super.initState();
    print("有圈初始化了");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        alignment: Alignment.center,
        child: Text(
          "有圈",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}
