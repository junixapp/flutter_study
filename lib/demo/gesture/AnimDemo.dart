import 'package:flutter/cupertino.dart';

class AnimDemo extends StatefulWidget {
  @override
  _AnimDemoState createState() => _AnimDemoState();
}

class _AnimDemoState extends State<AnimDemo>
    with SingleTickerProviderStateMixin {
  double top = 0;
  double maxTop = 500;
  double lastY = 0.0;
  double ballSize = 40;
  double rotate = 0;
  AnimationController controller;
  Tween tween;
  Tween sizeTween;
  Tween rotateTween;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    tween = Tween(begin: top, end: 0);
    sizeTween = Tween(begin: 40, end: 100);
    rotateTween = Tween(begin: 0.0, end: 360.0);
    tween.animate(controller);
    controller.addListener(() {
//      print("anim value: ${controller.value} => ${tween.evaluate(controller)}");
      setState(() {
        top = tween.evaluate(controller) * 1.0;
        ballSize = sizeTween.evaluate(controller) * 1.0;
        rotate = rotateTween.evaluate(controller)*1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              color: Color(0xffcaca11),
              height: 300,
            ),
            left: 0,
            top: top,
            height: 300,
            right: 0,
          ),
          buildBall()
        ],
      ),
      onVerticalDragStart: (details) {
        var position = details.localPosition;
        lastY = position.dy;
        sizeTween = Tween(begin: 40, end: 100);
        rotateTween = Tween(begin: 0.0, end: 360.0);
        controller.stop();
      },
      onVerticalDragUpdate: (details) {
        var position = details.localPosition;
        setState(() {
          top += (position.dy - lastY);
          if(top<0) top = 0;
          lastY = position.dy;
          var fraction = top/maxTop;
          if(fraction>1)fraction = 1.0;
          ballSize = sizeTween.begin+(sizeTween.end - sizeTween.begin)*fraction;
          rotate = rotateTween.begin+((rotateTween.end - rotateTween.begin)*fraction);
//          print("fraction: $fraction  rotate: $rotate  begin: ${rotateTween.begin}  end: ${rotateTween.end}");
        });
      },
      onVerticalDragEnd: (details) {
        setState(() {
          lastY = 0;
          controller.duration = Duration(milliseconds: (top * 0.5).toInt());
          tween.begin = top;

          sizeTween.begin = ballSize;
          sizeTween.end = 40;
          rotateTween.begin = rotate;
          rotateTween.end = 0.0;

          controller.reset();
          controller.forward();
        });
      },
    );
  }

  Widget buildBall() {
    return Positioned(
      left: 10,
      top: 40,
      width: ballSize,
      height: ballSize,
      child: Transform.rotate(angle: rotate/30, child: Image.asset(
        "images/beachball-alpha.png",
        width: ballSize,
        height: ballSize,
      ),)
    );
  }
}
