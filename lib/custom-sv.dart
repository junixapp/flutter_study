import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

main() => runApp(CustomSvApp());

class CustomSvApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "CustomScrollView用法",
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Demo'),
                titlePadding: EdgeInsets.all(20),
                background: Image.asset(
                  "images/fast.jpg", fit: BoxFit.cover,),
              ),
            ),
            SliverPadding(

              padding: const EdgeInsets.all(8.0),
              sliver: new SliverGrid( //Grid
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, //Grid按两列显示
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 4.0,
                ),
                delegate: new SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    //创建子widget
                    return InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.cyan[100 * (index % 9)],
                        child: new Text('grid item $index'),
                      ),
                      onTap: ()=>{},
                    );
                  },
                  childCount: 40,
                ),
              ),
            ),
            new SliverFixedExtentList(
              itemExtent: 150.0,
              delegate: new SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    //创建列表项
                    return new Container(
                      alignment: Alignment.center,
                      color: Colors.lightBlue[100 * (index % 9)],
                      child: new Text('list item $index'),
                    );
                  },
                  childCount: 50 //50个列表项
              ),
            ),
          ],
        )
      ),
    );
  }
}
