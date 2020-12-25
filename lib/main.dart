import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bean/directory.dart';
import 'widgets_directory/base_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        '/base_widgets': (BuildContext context) => BaseWidgets(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  List<WidgetsDirectory> _list = List();

  void _incrementCounter() {
    setState(() {

      int r = Random().nextInt(255);
      int g = Random().nextInt(255);
      int b = Random().nextInt(255);
      print("$r, $g $b");
    });
  }

  @override
  void initState() {
    _list.add(WidgetsDirectory("基础组件", "在构建您的第一个Flutter应用程序之前，您绝对需要了解这些widget。",
        routeName: "/base_widgets"));
    _list.add(WidgetsDirectory("Material Components",
        "实现了Material Design 指南的视觉、效果、motion-rich的widget。"));
    _list.add(WidgetsDirectory(
        "Cupertino(iOS风格的widget", "用于当前iOS设计语言的美丽和高保真widget。"));
    _list.add(WidgetsDirectory(
        "Layout", "排列其它widget的columns、rows、grids和其它的layouts。"));
    _list.add(WidgetsDirectory("Text", "文本显示和样式"));
    _list.add(WidgetsDirectory("Assets、图片、Icons", "管理assets, 显示图片和Icon。"));
    _list.add(WidgetsDirectory(
        "Input", "Material Components 和 Cupertino中获取用户输入的widget。"));
    _list.add(WidgetsDirectory("交互模型", "响应触摸事件并将用户路由到不同的页面视图（View）。"));
    _list.add(WidgetsDirectory("样式", "管理应用的主题，使应用能够响应式的适应屏幕尺寸或添加填充。"));
    _list.add(WidgetsDirectory("绘制和效果", "Widget将视觉效果应用到其子组件，而不改变它们的布局、大小和位置。"));
    _list.add(WidgetsDirectory("Async", "Flutter应用的异步模型"));
    _list.add(WidgetsDirectory("滚动", "滚动一个拥有多个子组件的父组件"));
    _list.add(WidgetsDirectory("辅助功能", "给你的App添加辅助功能(这是一个正在进行的工作)"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (buildContext, index) {
          return Card(
            // key: Key("${_list[index].hashCode}"),
            margin: EdgeInsets.all(10),
            child: FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "${_list[index].routeName}");
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 10,
                  ),
                  Text(
                    "${_list[index].title}",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Container(
                    height: 10,
                  ),
                  Text("${_list[index].subtitle}",
                      style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
              color: Colors.black54,
            ),
          );
        },
        itemCount: _list.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
