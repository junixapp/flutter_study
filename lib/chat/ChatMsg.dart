class ChatMsg {
  String content;
  int msgType;
  String avatar;
  String time;
  bool isMe;

  ChatMsg({this.content, this.msgType = 0, this.avatar, this.time,
    this.isMe = false});



  bool isText() => msgType == 0;

  bool isImage() => msgType == 1;
}