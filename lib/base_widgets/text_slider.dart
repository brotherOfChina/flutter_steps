import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextSlider extends StatelessWidget {
  final String title;
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;

  const TextSlider(
      {Key key,
      @required this.title,
      @required this.value,
      @required this.min,
      @required this.max,
      @required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 80,
          alignment: Alignment.center,
          child: Text(title),
        ),
        Container(
          width: screenWidth-80,
          alignment: Alignment.center,
          child: Slider(value: value, max: max, min: min, onChanged: onChanged),
        ),
      ],
    );
  }
}
