
 import 'package:flutter/material.dart';

class AlyBottomNavigationBarItem extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AlyBottomNavigationBarItemState();
  }
}

class _AlyBottomNavigationBarItemState extends State<AlyBottomNavigationBarItem> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: BottomNavigationBar(items: [
        BottomNavigationBarItem(),
        BottomNavigationBarItem(),
        BottomNavigationBarItem(),
      ])
    );
  }
}