import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/common/SuperText.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'Comment.dart';
import 'Recommend.dart';
import 'package:flutter_study/common/WidgetUtil.dart';

class ProdDetail extends StatefulWidget {
  @override
  _ProdDetailState createState() => _ProdDetailState();
}

class _ProdDetailState extends State<ProdDetail> {
  var statusBarHeight, windowH, windowW;
  
  ScrollController controller;
  var max = 300.0;
  var opacity = 1.0;
  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener((){
      var offset = controller.offset<0 ? 0 : controller.offset;
      if(offset > max) offset = max;
      setState(() {
        opacity = (1- offset / max);
//        print("offset: ${controller.offset} opacity: ${opacity}");
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    statusBarHeight = MediaQuery.of(context).padding.top;
    windowH = MediaQuery.of(context).size.height;
    windowW = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        buildContent(),
        buildTitleBar(statusBarHeight),
        buildBottom(windowH)
      ],
    ));
  }

  Widget buildTitleBar(double statusBarHeight) {
    return Positioned(
        top: 0,
        height: statusBarHeight + 46,
        right: 0,
        left: 0,
        child: Opacity(opacity: opacity,
        child: Container(
          color: Color(0xFFffffff),
          padding: EdgeInsets.only(top: statusBarHeight),
          child: Container(
            child: Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop()),
                Expanded(
                    child: Text(
                      "宝贝详情",
                      style: TextStyle(fontSize: 18),
                    )),
                IconButton(
                    icon: Icon(Icons.shopping_cart, color: Color(0xff555555)),
                    onPressed: () => {}),
                IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: Color(0xff555555),
                    ),
                    onPressed: () => {}),
              ],
            ),
          ),
        ),));
  }

  Widget buildBottom(double windowH) {
    return Positioned(
      top: windowH - 50,
      left: 0,
      right: 0,
      height: 50,
      child: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            ...[
              MapEntry("店铺", Icons.shopping_basket),
              MapEntry("客服", Icons.chat_bubble),
              MapEntry("收藏", Icons.star_border)
            ].map((entry) => buildIconTexts(entry.key, entry.value)).toList(),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: SuperText(
                  text: "加入购物车",
                  height: 40,
                  margin: EdgeInsets.only(left: 10),
                  gradient: LinearGradient(
                      colors: [Color(0xFFFFC100), Color(0xFFFF8000)]),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                )),
                Expanded(
                    child: SuperText(
                  text: "马上抢",
                  height: 40,
                  margin: EdgeInsets.only(right: 10),
                  bgColor: Colors.red,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                ))
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget buildIconTexts(String text, IconData iconData) {
    return SuperText(
      width: 50,
      text: text,
      iconPosition: IconPosition.Top,
      icon: Icon(
        iconData,
        color: Color(0xff666666),
        size: 18,
      ),
      textStyle: TextStyle(fontSize: 12),
    );
  }

  Widget buildContent() {
    return ListView(
      controller: controller,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(bottom: 50),
      children: <Widget>[
        buildSwiper(),
        buildHeader(),
        WidgetUtil.buildDivider(),
        buildAddress(),
        buildDiscount(),
        WidgetUtil.buildDivider(),
        buildSafe(), //保障
    WidgetUtil.buildDivider(),
        buildDelivery(), //配送地址
    WidgetUtil.buildDivider(),
        Comment(), //评论
    WidgetUtil.buildDivider(),
    Recommend(), //推荐
    WidgetUtil.buildDivider(),
      ],
    );
  }

  ///banner区域
  Widget buildSwiper() {
    var urls = [
      "https://img.alicdn.com/imgextra/i4/682012865/O1CN01D0YbIH1X2DGowomyF_!!682012865.jpg_430x430q90.jpg",
      "https://img.alicdn.com/imgextra/i4/682012865/O1CN018cNZC71X2DH7AxTFG_!!682012865.jpg_430x430q90.jpg",
      "https://img.alicdn.com/imgextra/i2/682012865/O1CN01FLtNJE1X2DGs9BTXr_!!682012865.jpg_430x430q90.jpg",
      "https://img.alicdn.com/imgextra/i2/682012865/O1CN01RlndQ01X2DGm9Vf92_!!682012865.jpg_430x430q90.jpg"
    ];
    return Container(
      height: windowW,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: urls[index],
          );
        },
        itemCount: urls.length,
//            pagination: SwiperPagination(
//                builder:
//                DotSwiperPaginationBuilder(activeColor: Color(0xffFF5000))),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text.rich(TextSpan(children: <InlineSpan>[
            TextSpan(
                text: "¥ ",
                style: TextStyle(fontSize: 14, color: Color(0xffFF5000))),
            TextSpan(
                text: "86-139",
                style: TextStyle(fontSize: 24, color: Color(0xffFF5000))),
            WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: SuperText(
                  text: "专属优惠",
                  width: 50,
                  margin: EdgeInsets.only(left: 10),
                  textStyle: TextStyle(color: Color(0xffFF5000), fontSize: 11),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  bgColor: Color(0x33FF9000),
                )),
            TextSpan(
                text: "\r\n价格 ", style: TextStyle(color: Color(0xff888999))),
            TextSpan(
                text: "¥ 150-238",
                style: TextStyle(
                    color: Color(0xff888999),
                    decoration: TextDecoration.lineThrough)),
          ])),
          RichText(
              text: TextSpan(children: <InlineSpan>[
            WidgetSpan(
                alignment: PlaceholderAlignment.bottom,
                child: Container(
                  padding: EdgeInsets.only(left: 4, right: 4, bottom: 1),
                  margin: EdgeInsets.only(top: 4, right: 3),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Text(
                    "天猫",
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                )),
            TextSpan(
                text: "李宁男鞋2018秋冬季新款油墨印刷防水耐磨减震跑鞋运动鞋ARHL061",
                style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 14,
                    fontWeight: FontWeight.bold))
          ])),
          Row(
            // 7人赞过，帮我选择
            children: <Widget>[
              Expanded(
                  child: SuperText(
                icon: Icon(
                  Icons.star_border,
                  color: Color(0xff999999),
                  size: 18,
                ),
                text: "7人赞过",
                textStyle: TextStyle(color: Color(0xff999999), fontSize: 13),
                iconSpace: 4,
                padding: EdgeInsets.only(top: 8, bottom: 4),
              )),
              Expanded(
                  child: SuperText(
                      icon: Icon(
                        Icons.help_outline,
                        color: Color(0xff999999),
                        size: 18,
                      ),
                      text: "帮我选择",
                      textStyle: TextStyle(color: Color(0xff999999), fontSize: 13),
                      iconSpace: 4,
                      padding: EdgeInsets.only(top: 8, bottom: 4)))
            ],
          ),
        ],
      ),
    );
  }

  ///发货地址
  Widget buildAddress() {
    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16),
            child: WidgetUtil.buildGrayText("发货"),
          ),
          Icon(
            Icons.location_on,
            size: 15,
            color: Color(0xff888888),
          ),
          Expanded(child: WidgetUtil.buildBlackText("山东潍坊        |        快递：0.00")),
          WidgetUtil.buildGrayText("月销38")
        ],
      ),
    );
  }

  ///优惠信息
  Widget buildDiscount() {
    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16),
            child: WidgetUtil.buildGrayText("优惠"),
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(text: TextSpan(children: <InlineSpan>[
                TextSpan(text: "领券至少可减", style: TextStyle(color: Color(0xff333333), fontSize: 13)),
                TextSpan(text: " ¥2 ",style: TextStyle(color: Color(0xffFf5000), fontSize: 13)),
              ])),
              WidgetUtil.buildSpace(4),
              RichText(text: TextSpan(children: <InlineSpan>[
                WidgetSpan(child: WidgetUtil.buildTag("店铺优惠券")),
                TextSpan(text: " 满80减2 ",style: TextStyle(color: Color(0xff333333), fontSize: 12)),
              ])),
              WidgetUtil.buildSpace(4),
              RichText(text: TextSpan(children: <InlineSpan>[
                WidgetSpan(child: WidgetUtil.buildTag("积分")),
                TextSpan(text: " 购买可得42积分 ",style: TextStyle(color: Color(0xff333333), fontSize: 12)),
              ])),
            ],
          )),
          WidgetUtil.buildGrayText("领券 "),
          Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xff999999))
        ],
      ),
    );
  }

  ///保障
  Widget buildSafe(){
    return Container(
        padding: EdgeInsets.all(12),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 16),
              child: WidgetUtil.buildGrayText("保障"),
            ),
            WidgetUtil.buildBlackText("正品保证 极速退款 退货运费险 七天退换")
          ],
        ),
    );
  }

  ///配送地址
  Widget buildDelivery(){
    var url = "https://img.alicdn.com/imgextra/i4/682012865/O1CN01D0YbIH1X2DGowomyF_!!682012865.jpg_430x430q90.jpg";
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 16),
                child: WidgetUtil.buildGrayText("选择"),
              ),
              Expanded(child: WidgetUtil.buildBlackText("配送至： 洪山区，选择 颜色分类，鞋码"),),
              Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xff999999))
            ],
          ),
          WidgetUtil.buildSpace(5),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 16),
                child: WidgetUtil.buildGrayText("        "),
              ),
              CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: url,
                width: 36,
                height: 36,
              ),
              WidgetUtil.buildSpace(4),
              CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: url,
                width: 36,
                height: 36,
              ),
              WidgetUtil.buildSpace(4),
              CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: url,
                width: 36,
                height: 36,
              ),
              WidgetUtil.buildSpace(10),
              SuperText(text: "共14种颜色分类可选", bgColor: Color(0xffe6e7e8), borderRadius: BorderRadius.all(Radius.circular(5)),
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10), textStyle: TextStyle(fontSize: 12, color: Color(0xff888888)),)
            ],
          ),
          WidgetUtil.buildSpace(15),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 16),
                child: WidgetUtil.buildGrayText("参数"),
              ),
              Expanded(child: WidgetUtil.buildBlackText("鞋码  品牌..."),),
            ],
          ),
        ],
      )
    );
  }



}
