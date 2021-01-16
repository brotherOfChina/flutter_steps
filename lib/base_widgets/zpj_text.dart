import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps/base_widgets/text_slider.dart';
import 'package:flutter_steps/widgets_directory/base_widgets.dart';

class ZpjText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _ZpjText();
  }
}

class _ZpjText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ZpjTextState();
  }
}

class _ZpjTextState extends State {
  double _fontSize = 16;
  Color _textColor;
  Color _backgroundColor;
  int _color = 0xffff0000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blueGrey,
            alignment: Alignment.center,
            width: screenWidth,
            height: screenHeight / 4,
            child: Text(
              "hi,china!!!",
              overflow: TextOverflow.fade,
              style: TextStyle(
                  color: Color(_color),
                  backgroundColor: Color(0xffffffff),
                  fontSize: _fontSize),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                TextSlider(
                    title: "颜色",
                    value: _color.toDouble(),
                    min: 0xff000000,
                    max: 0xffffffff,
                    onChanged: (value) {
                      setState(() {
                        _color = value.toInt();
                      });
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
