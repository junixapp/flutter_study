import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/common/SuperText.dart';

import 'package:flutter_study/common/WidgetUtil.dart';

class Recommend extends StatelessWidget {
  var recommendProd = [
    {
      "name": "李宁迪士尼米奇联名款短袖T恤女士2019新款休闲宽松针织运动上",
      "pic":
          "https://img.alicdn.com/bao/uploaded/O1CN01nOXUZe2CKRHRYR5BO_!!0-item_pic.jpg_180x180.jpg",
      "price": "99"
    },
    {
      "name": "李宁中筒中袜男士2019新款运动时尚系列透气24-26cm运动袜",
      "pic":
          "https://img.alicdn.com/bao/uploaded/O1CN01w3QMX62CKRHKlrRjU_!!0-item_pic.jpg_180x180.jpg",
      "price": "59"
    },
    {
      "name": "李宁篮球比赛裤男士2019新款篮球系列速干针织运动裤男",
      "pic":
          "https://img.alicdn.com/bao/uploaded/O1CN01hub9jv2CKRHNPHrOo_!!0-item_pic.jpg_180x180.jpg",
      "price": "169"
    },
    {
      "name": "李宁卫裤男士2019新款训练系列宽松休闲裤子男装平口针织运动长",
      "pic":
          "https://img.alicdn.com/bao/uploaded/O1CN01edrImp2CKRHQUF1lH_!!0-item_pic.jpg_180x180.jpg",
      "price": "239"
    },
    {
      "name": "李宁卫衣男女同款2019新款连帽卫衣宽松时尚休闲上衣针织运动服",
      "pic":
          "https://img.alicdn.com/bao/uploaded/O1CN01tubTcl2CKRHN0eamF_!!0-item_pic.jpg_180x180.jpg",
      "price": "219"
    },
    {
      "name": "李宁COUNTERFLOW溯时装周走秀款曜变天目风衣男士开衫连帽运",
      "pic":
          "https://img.alicdn.com/bao/uploaded/O1CN01PbiWPN2CKRHVm5AWi_!!0-item_pic.jpg_180x180.jpg",
      "price": "599"
    },
  ];

  var space = 6.0;
  var gridWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    var windowW = MediaQuery.of(context).size.width;
    gridWidth = (windowW - 10 * 2 - 24) / 3;
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: WidgetUtil.buildBlackText("店铺推荐")),
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
          WidgetUtil.buildSpace(6),
          Wrap(
            spacing: space,
            children: <Widget>[
              ...recommendProd.map((el) {
                return buildRecommendItem(el["name"], el["pic"], el["price"]);
              }).toList()
            ],
          )
        ],
      ),
    );
  }

  Widget buildRecommendItem(String name, String url, String price) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: gridWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              height: 100,
              width: gridWidth,
              imageUrl: url,
            ),
          ),
          WidgetUtil.buildSpace(8),
          Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Color(0xff333333), fontSize: 13),
          ),
          WidgetUtil.buildSpace(8),
          RichText(
              text: TextSpan(children: <InlineSpan>[
            TextSpan(
                text: "¥ ",
                style: TextStyle(fontSize: 11, color: Color(0xffff5000))),
            TextSpan(
                text: price,
                style: TextStyle(fontSize: 16, color: Color(0xffff5000))),
          ]))
        ],
      ),
    );
  }
}
