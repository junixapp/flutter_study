import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/common/SuperText.dart';

import 'package:flutter_study/common/WidgetUtil.dart';

class Comment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: WidgetUtil.buildBlackText("宝贝评价（2561）")),
              SuperText(
                text: "查看全部",
                textStyle: TextStyle(color: Color(0xffff5000)),
                iconPosition: IconPosition.Right,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xffff5000),
                  size: 18,
                ),
              )
            ],
          ),
          WidgetUtil.buildSpace(10),
          Row(
            children: <Widget>[
              WidgetUtil.buildTag("穿着效果不错(12)",
                  style: TextStyle(fontSize: 12, color: Color(0xff555555)),
                  padding:
                      EdgeInsets.only(top: 4, bottom: 4, left: 12, right: 12)),
              WidgetUtil.buildSpace(5),
              WidgetUtil.buildTag("鞋子不错(10)",
                  style: TextStyle(fontSize: 12, color: Color(0xff555555)),
                  padding:
                      EdgeInsets.only(top: 4, bottom: 4, left: 12, right: 12)),
              WidgetUtil.buildSpace(5),
              WidgetUtil.buildTag("质量很好(7)",
                  style: TextStyle(fontSize: 12, color: Color(0xff555555)),
                  padding:
                      EdgeInsets.only(top: 4, bottom: 4, left: 12, right: 12))
            ],
          ),
          WidgetUtil.buildSpace(10),
          Row(
            children: <Widget>[
              ClipOval(
                child: CachedNetworkImage(
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                  imageUrl:
                      "http://b-ssl.duitang.com/uploads/item/201805/13/20180513224039_tgfwu.png",
                ),
              ),
              WidgetUtil.buildSpace(10),
              WidgetUtil.buildGrayText("北冥有鱼"),
            ],
          ),
          WidgetUtil.buildSpace(10),
          WidgetUtil.buildBlackText(
              "鞋子很好看，穿着很舒服，鞋底很软，鞋面也非常的软，码数正常，很不错的宝贝，而且价格还很时候。"),
          WidgetUtil.buildSpace(25),
          WidgetUtil.buildLine(),
          WidgetUtil.buildSpace(25),
          Row(
            children: <Widget>[
              Expanded(child: WidgetUtil.buildBlackText("问大家（32）")),
              SuperText(
                text: "查看全部",
                textStyle: TextStyle(color: Color(0xffff5000)),
                iconPosition: IconPosition.Right,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xffff5000),
                  size: 18,
                ),
              )
            ],
          ),
          WidgetUtil.buildSpace(14),
          Row(
            children: <Widget>[
              Expanded(child: WidgetUtil.buildBlackText("冬天穿会不会零下十度左右")),
              WidgetUtil.buildGrayText("2个回答")
            ],
          ),
          WidgetUtil.buildSpace(6),
          Row(
            children: <Widget>[
              Expanded(child: WidgetUtil.buildBlackText("我的脚太胖了，能不能穿？")),
              WidgetUtil.buildGrayText("25个回答")
            ],
          ),
        ],
      ),
    );
  }
}
