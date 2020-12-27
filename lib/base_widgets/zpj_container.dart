import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps/base_widgets/text_slider.dart';
import 'dart:math';
import 'package:vector_math/vector_math_64.dart' as v;

class ZpjContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: _ZpjContainer(appbarHeight: appBar.preferredSize.height),
    );
  }

  AppBar appBar = AppBar(
    title: Text("CONTAINER"),
  );
}

class _ZpjContainer extends StatefulWidget {
  final double appbarHeight;

  const _ZpjContainer({Key key, this.appbarHeight}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ZpjContainerState(appbarHeight);
  }
}

class _ZpjContainerState extends State {
  double _margin = 10;
  double _padding = 10;
  double _alignmentX = 0.0;
  double _alignmentY = 0.0;
  double _colorR = 255;
  double _colorG = 100;
  double _colorB = 100;

  bool _openDecoration = false;
  double _decorationRadius = 20;

  double _containerHeight = 200.0;
  double _containerWidth = 200.0;

  final double appbarHeight;

  //translation
  double _translationX = 0;
  double _translationY = 0;
  double _translationZ = 0;

  //scale
  double _scaleX = 1;
  double _scaleY = 0.5;
  double _scaleZ = 0.5;

  //rotation
  double _rotationX = 0.1;
  double _rotationY = 0.1;
  double _rotationZ = 0.1;

  // constraints
  double constraintsHeight = 50;
  double constraintsWidth = 50;

  //border
  bool openBorder = false;

  _ZpjContainerState(this.appbarHeight);

  Matrix4 matrix4 = Matrix4.identity();

  @override
  void initState() {
    // matrix4.scale(1.0,1.0,1.0);
    super.initState();
  }

  @override
  void setState(fn) {
    // matrix4.scale(_scaleX, _scaleY, _scaleZ);
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(_margin),
          padding: EdgeInsets.all(_padding),
          alignment: Alignment(_alignmentX, _alignmentY),
          width: _containerWidth,
          height: _containerHeight,
          color: _openDecoration
              ? null
              : Color.fromARGB(
                  255, _colorR.toInt(), _colorG.toInt(), _colorB.toInt()),
          decoration: _openDecoration
              ? BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color.fromARGB(255, 255 - _colorR.toInt(),
                      255 - _colorG.toInt(), 255 - _colorB.toInt()),
                  borderRadius: openBorder
                      ? null
                      : BorderRadiusDirectional.all(
                          Radius.circular(_decorationRadius)),
                  //borderRadius 与  border 无法同时使用
                  border: openBorder
                      ? BorderDirectional(
                          top: BorderSide(color: Colors.black),
                          bottom: BorderSide(color: Colors.black),
                          start: BorderSide(color: Colors.black),
                          end: BorderSide(color: Colors.black),
                        )
                      : null,

          )
              : null,

          // transform: Matrix4.compose(
          //     v.Vector3(_translationX, _translationY, _translationZ),
          //     v.Quaternion.axisAngle(
          //         v.Vector3(_rotationX, _rotationY, _rotationZ),1),
          //     v.Vector3(_scaleX, _scaleY, _scaleZ)),
          transform: matrix4,

          child: Container(
            height: 50,
            width: 50,
            color: Colors.white,
          ),
        ),
        Container(
          height: screenHeight -
              (_containerHeight + appbarHeight + _margin * 2 + 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextSlider(
                  title: "Height",
                  value: _containerHeight,
                  max: 300,
                  min: 100,
                  onChanged: (value) {
                    setState(() {
                      _containerHeight = value;
                    });
                  },
                ),
                TextSlider(
                  title: "Width",
                  value: _containerWidth,
                  max: 300,
                  min: 100,
                  onChanged: (value) {
                    setState(() {
                      _containerWidth = value;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      alignment: Alignment.center,
                      child: Text("margin"),
                    ),
                    Container(
                      width: 310,
                      alignment: Alignment.center,
                      child: Slider(
                        value: _margin,
                        max: 20,
                        min: 5,
                        onChanged: (curValue) {
                          print("$curValue");
                          setState(() {
                            this._margin = curValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      alignment: Alignment.center,
                      child: Text("padding"),
                    ),
                    Container(
                      width: 310,
                      alignment: Alignment.center,
                      child: Slider(
                        value: _padding,
                        max: 20,
                        min: 5,
                        onChanged: (curValue) {
                          print("$curValue");
                          setState(() {
                            this._padding = curValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Text(
                  "Color",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      alignment: Alignment.center,
                      child: Text("colorR"),
                    ),
                    Container(
                      width: 310,
                      alignment: Alignment.center,
                      child: Slider(
                        value: _colorR,
                        max: 255,
                        min: 5,
                        onChanged: (curValue) {
                          print("$curValue");
                          setState(() {
                            this._colorR = curValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      alignment: Alignment.center,
                      child: Text("colorG"),
                    ),
                    Container(
                      width: 310,
                      alignment: Alignment.center,
                      child: Slider(
                        value: _colorG,
                        max: 255,
                        min: 5,
                        onChanged: (curValue) {
                          print("$curValue");
                          setState(() {
                            this._colorG = curValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      alignment: Alignment.center,
                      child: Text("colorB"),
                    ),
                    Container(
                      width: 310,
                      alignment: Alignment.center,
                      child: Slider(
                        value: _colorB,
                        max: 255,
                        min: 5,
                        onChanged: (curValue) {
                          print("$curValue");
                          setState(() {
                            this._colorB = curValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Text(
                  "Alignment",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      alignment: Alignment.center,
                      child: Text("alignmentX"),
                    ),
                    Container(
                      width: 310,
                      alignment: Alignment.center,
                      child: Slider(
                        value: _alignmentX,
                        max: 1,
                        min: -1,
                        onChanged: (curValue) {
                          print("$curValue");
                          setState(() {
                            this._alignmentX = curValue;
                          });
                        },
                        divisions: 20,
                        label: "${_alignmentX.toStringAsFixed(1)}",
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      alignment: Alignment.center,
                      child: Text("alignmentY"),
                    ),
                    Container(
                      width: 310,
                      alignment: Alignment.center,
                      child: Slider(
                        value: _alignmentY,
                        max: 1,
                        min: -1,
                        onChanged: (curValue) {
                          print("$curValue");
                          setState(() {
                            this._alignmentY = curValue;
                          });
                        },
                        label: "${_alignmentY.toStringAsFixed(1)}",
                        semanticFormatterCallback: (newValue) {
                          return "${_alignmentY}";
                        },
                        divisions: 10,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Decoration",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text("开启Decoration"),
                    ),
                    Switch(
                        value: _openDecoration,
                        onChanged: (value) {
                          setState(() {
                            _openDecoration = value;
                          });
                        })
                  ],
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text("开启Border"),
                    ),
                    Switch(
                        value: openBorder,
                        onChanged: (value) {
                          setState(() {
                            openBorder = value;
                          });
                        })
                  ],
                ),
                TextSlider(
                  title: "radius",
                  value: _decorationRadius,
                  min: 10,
                  max: 100,
                  onChanged: (value) {
                    setState(() {
                      _decorationRadius = value;
                    });
                  },
                ),
                Text(
                  "Translation",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextSlider(
                  title: "TranslationX",
                  value: _translationX,
                  min: 0,
                  max: 100,
                  onChanged: (value) {
                    setState(() {
                      _translationX = value;
                      matrix4.setTranslation(v.Vector3(
                          _translationX, _translationY, _translationZ));
                    });
                  },
                ),
                TextSlider(
                  title: "TranslationY",
                  value: _translationY,
                  min: 0,
                  max: 100,
                  onChanged: (value) {
                    setState(() {
                      _translationY = value;
                      matrix4.setTranslation(v.Vector3(
                          _translationX, _translationY, _translationZ));
                    });
                  },
                ),
                TextSlider(
                  title: "TranslationZ",
                  value: _translationZ,
                  min: 0,
                  max: 100,
                  onChanged: (value) {
                    setState(() {
                      _translationZ = value;
                      matrix4.setTranslation(v.Vector3(
                          _translationX, _translationY, _translationZ));
                    });
                  },
                ),
                TextSlider(
                  title: "RotationX",
                  value: _rotationX,
                  min: 0,
                  max: 1,
                  onChanged: (value) {
                    setState(() {
                      _rotationX = value;
                      matrix4.rotateX(_rotationX);
                    });
                  },
                ),
                TextSlider(
                  title: "RotationY",
                  value: _rotationY,
                  min: 0,
                  max: 1,
                  onChanged: (value) {
                    setState(() {
                      _rotationY = value;
                      matrix4.rotateY(_rotationY);
                    });
                  },
                ),
                TextSlider(
                  title: "RotationZ",
                  value: _rotationZ,
                  min: 0,
                  max: 1,
                  onChanged: (value) {
                    setState(() {
                      _rotationZ = value;
                      matrix4.rotateZ(_rotationZ);
                    });
                  },
                ),
                //todo 暂时搞不明白缩放为什么会异常
                TextSlider(
                  title: "ScaleX",
                  value: _scaleX,
                  min: 0,
                  max: 2,
                  onChanged: (value) {
                    setState(() {
                      _scaleX = value;
                      matrix4.scale(v.Vector3(_scaleX, 1, 1));
                    });
                  },
                ),
                TextSlider(
                  title: "ScaleY",
                  value: _scaleY,
                  min: 0,
                  max: 1,
                  onChanged: (value) {
                    setState(() {
                      _scaleY = value;
                      matrix4.scale(v.Vector3(1, _scaleY, 1));
                    });
                  },
                ),
                TextSlider(
                  title: "ScaleZ",
                  value: _scaleZ,
                  min: 0,
                  max: 1,
                  onChanged: (value) {
                    setState(() {
                      _scaleZ = value;
                      matrix4.scale(v.Vector3(1, 1, _scaleZ));
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
