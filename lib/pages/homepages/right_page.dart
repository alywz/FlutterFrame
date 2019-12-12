import 'package:flutter/material.dart';

class RightPage extends StatelessWidget {
  final arguments;

  const RightPage({Key key, this.arguments}) : super(key: key);


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
        child:GestureDetector(
          child: Text(
            this.arguments,
            style: TextStyle(fontSize: 20,color: Colors.black),
          ),
          onTap:()=>Navigator.pop(context,"返回的参数")
        )
      ),
    );
  }

}