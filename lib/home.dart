import 'package:flutter/material.dart';
import 'dart:ui';

import 'router.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
//    print("width: ${size.width}  height: ${size.height}");
//    var width = window.physicalSize.width; //单位是px
//    var height = window.physicalSize.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter展示 - ${size.width.toInt()}x${size.height.toInt()}"),
      ),
      body: ListView(
        children: <Widget>[
          buildButton("商品展示", ()=> Navigator.pushNamed(context, RouterName.prodList)),
          buildButton("即时通讯", ()=> Navigator.pushNamed(context, RouterName.chatList)),
          buildButton("动画能力", ()=>Navigator.pushNamed(context, RouterName.animation)),
        ],
      ),
    );
  }
}

Container buildButton(String text, VoidCallback onPressed){
  return Container( 
    padding: EdgeInsets.only(left: 30, right: 30, top: 10),
    child: RaisedButton(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
  onPressed: onPressed,
  child: Text(text),
  ),);
}