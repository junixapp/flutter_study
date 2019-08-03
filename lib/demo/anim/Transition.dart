import 'package:flutter/material.dart';

class TransitionDemo extends StatefulWidget {
  @override
  _TransitionDemoState createState() => _TransitionDemoState();
}

class _TransitionDemoState extends State<TransitionDemo>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  Animation<double> sizeFactor;
  Animation<double> scale;
  Animation<Offset> offset;
  bool _first = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

//    animation = Tween(begin: 1.0, end: 0.0).animate(animationController);
    sizeFactor = Tween(begin: 1.0, end: .3).animate(animationController);
    scale = Tween(begin: 1.0, end: .3).animate(animationController)
      ..addListener(() {
        setState(() {
          print(animationController.status.toString()+ "  " + animationController.value.toString());
        });
      });
//    offset = Tween(begin: Offset(0, 0), end: Offset(1, .5))
//        .animate(animationController);
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _first = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
//        FadeTransition(
//          opacity: animation,
//          child: InkWell(
//            onTap: ()  {
//              animationController.forward();
//              Future.delayed(Duration(seconds: 1), (){animationController.reverse();});
//            },
//            child: Container(
//              color: Colors.red,
//              width: 100,
//              height: 100,
//            ),
//          ),
//        ),
//        SlideTransition(position: offset, child: InkWell(
//          onTap: (){
//            animationController.forward();
//            Future.delayed(Duration(seconds: 1), (){animationController.reverse();});
//          },
//          child: Container(
//            constraints: BoxConstraints.loose(Size(100, 100)),
//            color: Colors.red,
//            width: 100,
//            height: 100,
//          ),
//        )),
        ScaleTransition(
            scale: scale,
            child: InkWell(
              onTap: () {
                animationController.forward();
                Future.delayed(Duration(seconds: 1), () {
                  animationController.reverse();
                });
              },
              child: Container(
                constraints: BoxConstraints.loose(Size(100, 100)),
                color: Colors.red,
                width: 100,
                height: 100,
              ),
            )),
//        AnimatedCrossFade(
//          duration: const Duration(seconds: 3),
//          firstChild: const FlutterLogo(
//              style: FlutterLogoStyle.horizontal, size: 100.0),
//          secondChild:
//              const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
//          crossFadeState:
//              _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
//        )
      ],
    );
  }
}
