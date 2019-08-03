import 'package:flutter_study/chat/ChatMsg.dart';

class ChatApi {
  static String targetAvatar = "http://b-ssl.duitang.com/uploads/item/201408/26/20140826185231_Xa2E3.jpeg";
  static String myAvatar = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563897280629&di=9e25a69784bea07695e2ef408d2f96e1&imgtype=0&src=http%3A%2F%2Fwww.touxiang.cn%2Fuploads%2F20130819%2F19-081720_278.jpg";
  static List<ChatMsg> getChatMsg() {
    return [
      ChatMsg(
          content: "现在在家吗？",
          avatar: targetAvatar,
          time: "早上 9:32"),
      ChatMsg(
          content: "不在，在加班写代码，搞什么。", isMe: true,
          avatar:myAvatar),
      ChatMsg(
          content: "给你发个照片，猜猜我现在在哪，嘿嘿。。。你从来没有见过的，在网上也没有出现过的照片，不信可以在百度搜搜。",
          avatar:targetAvatar),
      ChatMsg(
          content: "稍等一下啊，我先找找，这几天拍的照片太多了，不太好找。。",
          avatar:targetAvatar),
      ChatMsg(
          content:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563897150155&di=4179d2fcda196a2aa11d7e4c1ed06351&imgtype=0&src=http%3A%2F%2Frizhao.dzwww.com%2Fyl%2F201907%2FW020190723518369129626.jpg",
          avatar:targetAvatar,
          msgType: 1),
      ChatMsg(
          content:
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563897384617&di=9bec14f9735c94ad793b8cfd1d656caa&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201409%2F21%2F20140921201113_YrmWa.jpeg",
          avatar:targetAvatar,
          msgType: 1),
      ChatMsg(
          content: "哇哦，这是哪里啊，要开演唱会了？别忘了给我留几个VIP座位哦。", isMe: true,
          avatar:myAvatar),
      ChatMsg(
          content: "OK，当然没问题的啦！咱们俩的关系，从小撒尿和泥长大。对了，你什么时候发下一个专辑啊？",
          avatar:targetAvatar),
      ChatMsg(
          time: "下午 13:33",
          content: "http://i2.hdslb.com/bfs/archive/8bf3edbd8b2aab991a661537dadf194fc0769741.jpg",
          isMe: true, avatar:myAvatar, msgType: 1),
      ChatMsg(
          content: "看看我的表情，嘿嘿。。猜我看到了什么呀？", isMe: true,
          avatar:myAvatar),
    ];
  }

  static ChatMsg createMyMsg(String msg){
    return ChatMsg(content: msg, isMe: true,
        avatar:myAvatar);
  }
}
