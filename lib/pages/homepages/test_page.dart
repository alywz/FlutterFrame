import 'package:flutter/material.dart';

class RightPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "第二页",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back) ,onPressed: (){
          Navigator.pop(context);
        },),
        backgroundColor: Colors.yellow,
        // 不显示返回键
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.navigate_before, color: Colors.black, size: 64.0),
        ),
      ),
    );
  }
}