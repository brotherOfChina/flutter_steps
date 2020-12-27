import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps/base_widgets/zpj_container.dart';
import 'package:flutter_steps/base_widgets/zpj_row_column.dart';
import 'package:flutter_steps/bean/directory.dart';

class BaseWidgets extends StatelessWidget {
  List<WidgetsDirectory> _list = List();

  @override
  Widget build(BuildContext context) {
    _list.add(
      WidgetsDirectory("Container", "一个拥有绘制、定位、调整大小的 widget。",
          widgetChild: ZpjContainer(), routeName: "zpj_container"),
    );
    _list.add(WidgetsDirectory("Row", "在水平方向上排列子widget的列表。",
        widgetChild: ZpjRowColumn(), routeName: "zpj_row_column"));
    _list.add(WidgetsDirectory("Column", "在垂直方向上排列子widget的列表。"));
    _list.add(WidgetsDirectory("Text", "单一格式的文本"));
    _list.add(WidgetsDirectory("Icon", "A Material Design icon."));
    _list.add(WidgetsDirectory(
        "RaisedButton", "Material Design中的button， 一个凸起的材质矩形按钮"));
    _list.add(WidgetsDirectory("Scaffold",
        "Material Design布局结构的基本实现。此类提供了用于显示drawer、snackbar和底部sheet的API。"));
    _list.add(WidgetsDirectory("Appbar",
        "一个Material Design应用程序栏，由工具栏和其他可能的widget（如TabBar和FlexibleSpaceBar）组成。"));
    _list.add(WidgetsDirectory(
        "FlutterLogo", "Flutter logo, 以widget形式. 这个widget遵从IconTheme。"));
    _list.add(WidgetsDirectory(
        "Placeholder", "一个绘制了一个盒子的的widget，代表日后有widget将会被添加到该盒子中"));
    Map<String, WidgetBuilder> routes = Map();
    _list.forEach((element) {
      routes[element.routeName] = (BuildContext context) => element.widgetChild;
    });
    return MaterialApp(
      title: "基础组件",
      home: Scaffold(
        body: _BaseWidgets(
          list: _list,
        ),
      ),
      theme:
          ThemeData(primarySwatch: Colors.blue, backgroundColor: Colors.white),
      routes: routes,
    );
  }
}

class _BaseWidgets extends StatefulWidget {
  final List<WidgetsDirectory> list;

  const _BaseWidgets({Key key, this.list}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BaseWidgetsState(list);
  }
}

class _BaseWidgetsState extends State<_BaseWidgets> {
  final List<WidgetsDirectory> _list;

  _BaseWidgetsState(this._list);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
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
                  Container(
                    height: 10,
                  ),
                ],
              ),
              color: Colors.black54,
            ),
          );
        },
        itemCount: _list.length,
      ),
    );
  }
}
