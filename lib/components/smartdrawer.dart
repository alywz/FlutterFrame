import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///自定义抽屉,带动作回调,和打开的百分比
class AlySmartDrawer extends StatefulWidget {
  final double elevation;
  final Widget child;
  final String semanticLabel;
  final double widthPercent;

  ///add start
  final DrawerCallback callback;

  ///add end
  const AlySmartDrawer({
    Key key,
    this.elevation = 16.0,
    this.child,
    this.semanticLabel,
    this.widthPercent = 0.8, //默认占据屏幕的百分比
    ///add start
    this.callback, //打开关闭的回调
    ///add end
  })  : assert(widthPercent < 1.0 && widthPercent > 0.0),
        super(key: key);

  @override
  _AlySmartDrawerState createState() => _AlySmartDrawerState();
}

class _AlySmartDrawerState extends State<AlySmartDrawer> {
  @override
  void initState() {
    ///add start
    if (widget.callback != null) {
      widget.callback(true);
    }

    ///add end
    super.initState();
  }

  @override
  void dispose() {
    ///add start
    if (widget.callback != null) {
      widget.callback(false);
    }

    ///add end
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    String label = widget.semanticLabel;
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        label = widget.semanticLabel;
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        label = widget.semanticLabel ??
            MaterialLocalizations.of(context)?.drawerLabel;
    }
    final double _width =
        MediaQuery.of(context).size.width * widget.widthPercent;
    return Semantics(
      scopesRoute: true,
      namesRoute: true,
      explicitChildNodes: true,
      label: label,
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(width: _width),
        child: Material(
          elevation: widget.elevation,
          child: widget.child,
        ),
      ),
    );
  }
}
