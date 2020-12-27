import 'package:flutter/material.dart';
import 'package:flutter_steps/base_widgets/text_slider.dart';

class ZpjRowColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _ZpjRowColumn();
  }
}

class _ZpjRowColumn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ZpjRowState();
  }
}

class _ZpjRowState extends State {
  AppBar appBar = AppBar(
    title: Text("CONTAINER"),
  );
  double appbarHeight;
  double screenHeight;
  double screenWidth;
  List<String> _list = List.empty(growable: true);

  int mainSelectedValue = 0;
  int crossSelectedValue = 0;

  @override
  void initState() {
    for (var i = 0; i < 4; i++) {
      _list.add("value:$i");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              child: Row(
                textBaseline: TextBaseline.ideographic,
                  mainAxisAlignment:
                      MainAxisAlignment.values[mainSelectedValue],
                  crossAxisAlignment:
                      CrossAxisAlignment.values[crossSelectedValue],
                  children: _list.map((e) {
                    return Container(
                      margin: EdgeInsets.all(1),
                      width: 30,
                      height: 30,
                      color: Colors.amberAccent,
                    );
                  }).toList())),
          Container(
            height: (screenHeight - appbarHeight - 24) / 3,
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
                  title: Text("${MainAxisAlignment.values[e.index]}"),
                );
              }).toList(),
            ),
          ),
          Container(
            height: (screenHeight - appbarHeight - 24) / 3,
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
                  title: Text("${CrossAxisAlignment.values[e.index]}"),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
