import 'package:flutter/material.dart';

/////折叠组件
//class NestScrollViewPage extends StatelessWidget {
//  final arguments;
//
//  NestScrollViewPage({
//    Key key,
//    this.arguments,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: NestedScrollView(
//        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//          return <Widget>[
//            SliverOverlapAbsorber(
//              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
//              child: SliverAppBar(
//                primary: true,
//                leading: Icon(Icons.arrow_back),
//                forceElevated: innerBoxIsScrolled,
//                flexibleSpace: FlexibleSpaceBar(
//                  centerTitle: true,
//                  title: Text(
//                    "FlexibleSpaceBar",
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  collapseMode: CollapseMode.parallax,
//                  background: Image.network(
//                    "http://pic1.win4000.com/cover/2018-09-25/20180925143430_85160.jpg",
//                    fit: BoxFit.cover,
//                  ),
//                ),
//                expandedHeight: 200,
//                pinned: true,
////                bottom: PreferredSize(
////                  child: Container(),
////                  preferredSize: Size.fromHeight(200),
////                ),
//              ),
//            ),
////            SliverPersistentHeader(
////                delegate: CustomSliverPersistentHeaderDelegate(
////              max: 10,
////              min: 10,
////              child: Container(
////                  color: Colors.white, child: Text("SliverPersistentHeader")),
////            ))
//          ];
//        },
//        body: Container(
//          color: Colors.white,
//          child: Text(
//            "我是身体",
//            style: TextStyle(color: Colors.black),
//          ),
//        ),
//      ),
//    );
//  }
//}

class NestScrollViewPage extends StatelessWidget {
  final arguments;

  NestScrollViewPage({Key key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        slivers: getListWidget(),
      ),
    );
  }

  List<Widget> getListWidget() {
    return <Widget>[
      SliverAppBar(
        pinned: true,
        expandedHeight: 250.0,
        flexibleSpace: FlexibleSpaceBar(
          background: Image.network(
            "http://d.hiphotos.baidu.com/zhidao/pic/item/2e2eb9389b504fc2de49fce3e4dde71191ef6dc5.jpg",
            fit: BoxFit.cover,
          ),
          centerTitle: true,
          title: Text('Demo'),
        ),
      ),
      SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 4.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.teal[100 * (index % 9)],
              child: Text('grid item $index'),
            );
          },
          childCount: 20,
        ),
      ),
      SliverFixedExtentList(
        itemExtent: 50.0,
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.lightBlue[100 * (index % 9)],
              child: Text('list item $index'),
            );
          },
        ),
      ),
    ];
  }
}
