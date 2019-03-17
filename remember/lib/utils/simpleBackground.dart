import 'package:flutter/material.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';

class SimpleBackground extends StatelessWidget {

  SimpleBackground({
    this.children,
  });
  final List<Widget> children;

  _changeNavigationBarColor(Color color) async {
    await FlutterStatusbarManager.setStyle(StatusBarStyle.DARK_CONTENT);
    await FlutterStatusbarManager.setNavigationBarStyle(NavigationBarStyle.DARK);
    await FlutterStatusbarManager.setColor(Colors.black.withOpacity(0.0), animated: true);
    await FlutterStatusbarManager.setNavigationBarColor(color, animated: true); 
  }

  @override
  Widget build(BuildContext context) {
    _changeNavigationBarColor(Theme.of(context).primaryColor.withOpacity(0.5));
    return new Scaffold(
      body: new Center(
        child: new Container(
          child: new Container(
            margin: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: children
            )
          ),
          height: double.infinity,
          width: double.infinity,
          color: Theme.of(context).backgroundColor,
        )
      ),
    );
  }
}
