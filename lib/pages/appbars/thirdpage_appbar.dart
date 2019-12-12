import 'package:flutter/material.dart';

class HomePageAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("更多",style: TextStyle(fontSize: 17),),centerTitle: true,),
    );
  }
  
}
