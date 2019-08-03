import 'package:flutter/material.dart';
import 'package:flutter_study/product/ProdDetail.dart';

import 'animation/home.dart';
import 'chat/ChatList.dart';
import 'home.dart';
import 'product/prod_list.dart';
/// 路由表

class RouterName {
  static const String home = '/';
  static const String prodList = '/prodList';
  static const String prodDetail = '/prodDetail';
  static const String chatList = '/chatList';
  static const String animation = '/animation';
}

/// 动态路由
Route<dynamic> createRouter(RouteSettings setting) {
  switch (setting.name) {
    case RouterName.home:
      return SlideRightRoute(widget: Home(), settings: setting);
    case RouterName.prodList:
      return SlideRightRoute(widget: ProdList(), settings: setting);
    case RouterName.prodDetail:
      return SlideRightRoute(widget: ProdDetail(), settings: setting);
    case RouterName.chatList:
      return SlideRightRoute(widget: ChatList(), settings: setting);
    case RouterName.animation:
      return SlideRightRoute(widget: AnimationDemoHome(), settings: setting);
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;
  final RouteSettings settings;

  SlideRightRoute({this.widget, this.settings})
      : super(
    settings: settings,
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return widget;
    },
    transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child) {
      return new SlideTransition(
        position: new Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}
