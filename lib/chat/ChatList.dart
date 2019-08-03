import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/common/SuperText.dart';
import 'package:flutter_study/common/WidgetUtil.dart';
import 'package:flutter_study/data/ChatApi.dart';

import 'ChatMsg.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> with WidgetsBindingObserver {
  TextEditingController inputController;
  List<ChatMsg> msgData = ChatApi.getChatMsg();
  ScrollController scrollController = ScrollController();
  double scrollPosi = 0;
  @override
  void initState() {
    super.initState();
    inputController = TextEditingController();
    inputController.addListener(() {

    });
    WidgetsBinding.instance.addObserver(this);
    ///监听滚动
    scrollController.addListener((){
      scrollPosi = scrollController.offset;
      print("scrollPosi: $scrollPosi  max: ${scrollController.position.maxScrollExtent}");
    });
  }

  bool first = true;
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback((duration){
      WidgetsBinding.instance.ensureVisualUpdate();
      var bottom = MediaQuery.of(context).viewInsets.bottom;
//      print("bottom: $bottom   duration: $duration max: ${scrollController.position.maxScrollExtent}");
      setState(() {

//        scrollController.jumpTo(scrollPosi);
        double maxScroll = scrollController.position.maxScrollExtent;
        if(maxScroll==null) {
          print("maxScroll为空， 忽略scroll");
          return;
        }
          if (bottom >0) {
            print("打开了: $maxScroll");
            scrollController.animateTo(first? (maxScroll+bottom) : maxScroll,
                duration: Duration(milliseconds: 250), curve: Curves.decelerate);
//            scrollController.jumpTo(maxScroll);
            first = false;
          }else{
            if(scrollPosi==null)return;
            scrollController.jumpTo(scrollPosi);
//          scrollController.animateTo(scrollPosi,
//              duration: Duration(milliseconds: 300), curve: Curves.decelerate);
            print("关闭了 $maxScroll");
          }
        });
      });

  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    first = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f1f0),
      body: Column(
        children: <Widget>[
          buildTitleBar(context),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
                physics: BouncingScrollPhysics(),
                itemCount: msgData.length,
                itemBuilder: (context, index) {
                  ChatMsg msg = msgData[index];
                  return msg.isMe ? buildRightItem(msg) : buildLeftItem(msg);
                }),
          ),
          buildBottom()
        ],
      ),
    );
  }

  Widget buildRightItem(ChatMsg msg) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          if (msg.time != null)
            Text(
              msg.time,
              style: TextStyle(color: Color(0xff777777), fontSize: 10),
            ),
          WidgetUtil.buildSpace(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              msg.isText()
                  ? buildTextMsg(msg.content, isRight: msg.isMe)
                  : buildImageMsg(msg.content, isRight: msg.isMe),
              WidgetUtil.buildSpace(10),
              buildAvatar(msg.avatar)
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLeftItem(ChatMsg msg) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          if (msg.time != null)
            Text(
              msg.time,
              style: TextStyle(color: Color(0xff777777), fontSize: 10),
            ),
          WidgetUtil.buildSpace(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildAvatar(msg.avatar),
              WidgetUtil.buildSpace(10),
              msg.isText()
                  ? buildTextMsg(msg.content, isRight: msg.isMe)
                  : buildImageMsg(msg.content, isRight: msg.isMe),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildAvatar(String avatar) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: CachedNetworkImage(
        width: 40,
        height: 40,
        fit: BoxFit.fill,
        imageUrl: avatar,
        errorWidget: (context, url, error) => Icon(
          Icons.error,
          size: 40,
        ),
      ),
    );
  }

  Widget buildTextMsg(String text, {bool isRight = true}) {
    return Container(
      constraints: BoxConstraints.loose(Size.fromWidth(260)),
      child: Text(text, style: TextStyle(color: Color(0xff111111), fontSize: 15)),
      decoration: BoxDecoration(color: isRight ? Color(0xff9EEA6A) : Colors.white,
          borderRadius: BorderRadius.circular(3)),
      padding: EdgeInsets.only(top: 8, bottom: 8, right: 12, left: 12), );
  }

  Widget buildImageMsg(String url, {bool isRight = true}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: CachedNetworkImage(
        width: 200,
        alignment: isRight ? Alignment.topRight : Alignment.topLeft,
        fit: BoxFit.fitWidth,
        imageUrl: url,
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }

  Widget buildTitleBar(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
          left: 15,
          top: 12 + WidgetUtil.getStatusBarHeight(context),
          right: 15,
          bottom: 12),
      child: Row(
        children: <Widget>[
          InkWell(child: Icon(Icons.arrow_back_ios,
              color: Color(0xff555555)), onTap: ()=> Navigator.pop(context),),
          WidgetUtil.buildSpace(8),
          Expanded(
              child: Text(
            "周杰伦",
            style: TextStyle(color: Color(0xff232323), fontSize: 18),
          )),
          Icon(
            Icons.more_horiz,
            color: Color(0xff232323),
          )
        ],
      ),
    );
  }

  void sendMsg(String msg){
    setState(() {
      msgData.add(ChatApi.createMyMsg(msg));
      inputController.clear();
      WidgetsBinding.instance.addPostFrameCallback((duration){
        scrollController.animateTo( scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.decelerate);
      });
    });

  }

  Widget buildBottom() {
    return Container(
      padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.keyboard_voice,
            color: Color(0xff222222),
          ),
          WidgetUtil.buildSpace(6),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 6, bottom: 6, left: 10, right: 10),
              margin: EdgeInsets.only(top: 3, bottom: 3),
              color: Color(0xfff1f1f1),
              child: TextField(
                controller: inputController,
                cursorColor: Color(0xff222222),
                decoration: null,
              ),
            ),
          ),
          WidgetUtil.buildSpace(6),
          SuperText(
            text: "发送",
            borderRadius: BorderRadius.circular(3),
            textStyle: TextStyle(color: Colors.white),
            padding: EdgeInsets.only(top: 4, bottom: 4, left: 14, right: 14),
            bgColor: Color(0xff00d30c),
            onTap: () => sendMsg(inputController.text),
          ),
        ],
      ),
    );
  }
}
