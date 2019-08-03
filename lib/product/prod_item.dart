import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/bean/product.dart';

import '../router.dart';

class ProdItem extends StatefulWidget {
  Product product;

  ProdItem({this.product});

  @override
  _ProdItemState createState() => _ProdItemState();
}

class _ProdItemState extends State<ProdItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 2,
          child: InkWell(
            onTap: ()=> Navigator.of(context).pushNamed(RouterName.prodDetail),
            child: Row(
              children: <Widget>[
                buildImage(),
                Expanded(child: buildTextArea())
              ],
            ),
          ),
        ));
  }

  Widget buildImage() {
    return CachedNetworkImage(
      width: 150,
      height: 145,
      fit: BoxFit.cover,
      imageUrl: widget.product.picUrl,
//      placeholder: (context, url) => Container(child: CircularProgressIndicator(), width: 150, height: 145, padding: EdgeInsets.all(50),),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  Widget buildTextArea() {
    return Container(
      height: 145,
      padding: EdgeInsets.only(left: 10, top: 3, bottom: 3, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.product.title,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          buildBandTags(),
          buildDiscountTags(),
          buildPrice(),
          buildAddress()
        ],
      ),
    );
  }

  Widget buildBandTags() {
    return Text(
      widget.product.bandTags.join("  |  "),
      style: TextStyle(fontSize: 12, color: Color(0xff888888)),
    );
  }

  Widget buildDiscountTags() {
    return Row(
      children: widget.product.discountTags.map((el) {
        return Container(
            margin: EdgeInsets.only(right: 4),
            padding: EdgeInsets.only(left: 2, right: 2),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xffFF5000), width: .5),
                borderRadius: BorderRadius.all(Radius.circular(2))),
            child: Text(
              el,
              style: TextStyle(color: Color(0xffFF5000), fontSize: 10),
            ));
      }).toList(),
    );
  }

  Widget buildPrice() {
    return RichText(
        text: TextSpan(children: <InlineSpan>[
      TextSpan(
          text: "¥ ", style: TextStyle(color: Color(0xffFF5000), fontSize: 11)),
      TextSpan(
          text: "${widget.product.price}   ",
          style: TextStyle(color: Color(0xffFF5000), fontSize: 20)),
      TextSpan(
          text: "${widget.product.buyCount}人已付款   ",
          style: TextStyle(color: Color(0xff888888), fontSize: 11)),
      TextSpan(
          text: widget.product.address,
          style: TextStyle(color: Color(0xff888888), fontSize: 11)),
    ]));
  }

  Widget buildAddress() {
    return Container(
      child: Text("${widget.product.shopName} > ",
          style: TextStyle(color: Color(0xff888888), fontSize: 11)),
    );
  }
}
