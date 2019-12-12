import 'package:flutter/material.dart';

///Aly 自定义页面切换动画 - 渐变切换
class AlyCustomPageRouteBuilder extends PageRouteBuilder{
  // 跳转的页面
  final Widget widget;
  AlyCustomPageRouteBuilder(this.widget):super(
      transitionDuration:Duration(milliseconds: 300),
      pageBuilder:(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
        return widget;
      },
      transitionsBuilder:(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child){
        return FadeTransition(child:child,
            opacity: Tween(begin: 0.0,end: 1.0)
                .animate(CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn))
        );
      }
  );
}
///Aly自定义切换动画 从右往左切换 (比较常用) 可以直接用  Navigator.push(context, CupertinoPageRoute(builder: (context) {return RightPage();}));
class AlyCustomPageRouteRLBuilder extends PageRouteBuilder{

}


