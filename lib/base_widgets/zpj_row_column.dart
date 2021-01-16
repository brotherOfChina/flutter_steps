import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps/base_widgets/text_slider.dart';

class ZpjRowColumn extends StatelessWidget {
  final bool isRow;

  const ZpjRowColumn({Key key, this.isRow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ZpjRowColumn(
      isRow: isRow,
    );
  }
}

class _ZpjRowColumn extends StatefulWidget {
  final bool isRow;

  const _ZpjRowColumn({Key key, this.isRow}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ZpjRowState(
      isRow,
    );
  }
}

class _ZpjRowState extends State {
  bool isRow = true;

  _ZpjRowState(this.isRow);

  double appbarHeight;
  double screenHeight;
  double screenWidth;
  List<String> _list = List.empty(growable: true);

  int mainSelectedValue = 0;
  int crossSelectedValue = 0;

  bool ltr = true;

  @override
  void initState() {
    for (var i = 0; i < 4; i++) {
      _list.add("$i");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text(isRow ? "Row" : "Column"),
    );
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    appbarHeight = appBar.preferredSize.height;
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Container(
              color: Colors.black12,
              height: (screenHeight - appbarHeight - 24) / 3,
              width: screenWidth,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: screenWidth,
                    height: (screenHeight - appbarHeight - 24) / 3,
                    child: isRow
                        ? Row(
                            textDirection:
                                ltr ? TextDirection.ltr : TextDirection.rtl,
                            textBaseline: TextBaseline.ideographic,
                            mainAxisAlignment:
                                MainAxisAlignment.values[mainSelectedValue],
                            crossAxisAlignment:
                                CrossAxisAlignment.values[crossSelectedValue],
                            children: _list.map((e) {
                              return Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(1),
                                width: 30,
                                height: 30,
                                child: Text(e),
                                color: Colors.amberAccent,
                              );
                            }).toList())
                        : Column(
                            verticalDirection: ltr
                                ? VerticalDirection.down
                                : VerticalDirection.up,
                            textBaseline: TextBaseline.ideographic,
                            mainAxisAlignment:
                                MainAxisAlignment.values[mainSelectedValue],
                            crossAxisAlignment:
                                CrossAxisAlignment.values[crossSelectedValue],
                            children: _list.map((e) {
                              return Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(1),
                                width: 30,
                                height: 30,
                                child: Text(e),
                                color: Colors.amberAccent,
                              );
                            }).toList()),
                  ),
                  Row(
                    children: [
                      Text(isRow ? "左到右" : "上到下"),
                      Switch(
                          value: ltr,
                          onChanged: (value) {
                            setState(() {
                              ltr = value;
                            });
                          }),
                    ],
                  ),
                ],
              )),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "MainAxisAlignment",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    height: (screenHeight - appbarHeight - 24) / 3 * 2 - 40,
                    width: screenWidth / 2 - 10,
                    child: ListView(
                      children: MainAxisAlignment.values.map((e) {
                        return RadioListTile(
                          value: e.index,
                          groupValue: mainSelectedValue,
                          activeColor: Colors.black87,
                          autofocus: true,
                          selected: e.index == mainSelectedValue,
                          selectedTileColor: Colors.blueAccent,
                          onChanged: (value) {
                            setState(() {
                              mainSelectedValue = value;
                            });
                          },
                          title: Text("${MainAxisAlignment.values[e.index]}"
                              .split(".")[1]),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Container(
                width: screenWidth / 2 - 10,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "CrossAxisAlignment",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      height: (screenHeight - appbarHeight - 24) / 3 * 2 - 40,
                      child: ListView(
                        children: CrossAxisAlignment.values.map((e) {
                          return RadioListTile(
                            value: e.index,
                            groupValue: crossSelectedValue,
                            activeColor: Colors.black87,
                            autofocus: true,
                            selected: e.index == crossSelectedValue,
                            selectedTileColor: Colors.blueAccent,
                            onChanged: (value) {
                              setState(() {
                                crossSelectedValue = value;
                              });
                            },
                            title: Text("${CrossAxisAlignment.values[e.index]}"
                                .split(".")[1]),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
