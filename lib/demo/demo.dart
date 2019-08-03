import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Center(
            child: buildRow(),
          ),
        ));
  }
}

Widget buildRow() {
  return RichText(
      text: TextSpan(children: <InlineSpan>[
    WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: Container(
          padding: EdgeInsets.only(left: 8, right: 8, top: 3, bottom: 3),
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Text("天猫"),
        )),
    TextSpan(
        text: "撒大师大师大师大所大所大所多所多爱的飒飒大撒打四大大师大师大是",
        style: TextStyle(color: Colors.black))
  ]));
}
