import 'package:flutter/cupertino.dart';

class WidgetUtil{

  static Widget buildDivider() {
    return Container(
      height: 10,
      color: Color(0xfff1f1f1),
    );
  }

  static Widget buildGrayText(String text) {
    return Text(
      text,
      style: TextStyle(color: Color(0xff888888), fontSize: 12),
    );
  }

  static Widget buildBlackText(String text) {
    return Text(
      text,
      style: TextStyle(color: Color(0xff333333), fontSize: 13),
    );
  }

  static Widget buildTag(String text, {EdgeInsets padding = const EdgeInsets.only(left: 5, right: 5, bottom: 1),
    TextStyle style = const TextStyle(color: Color(0xffFF5000), fontSize: 10) }){
    return Container(
      padding: padding,
      decoration: BoxDecoration(color: Color(0x33FF9000), borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Text(text, style: style,),
    );
  }

  static Widget buildSpace(double height){
    return Container(
      height: height,
      width: height,
    );
  }

  static Widget buildLine({Color color = const Color(0xfff1f1f1)}){
    return Container(
      height: 1,
      color: color,
    );
  }

  static double getStatusBarHeight(BuildContext context){
    return MediaQuery.of(context).padding.top;
  }
  static double getWidthWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
  static double getWidthHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
}