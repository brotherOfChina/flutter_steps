import 'package:flutter/material.dart';
import 'package:flutter_steps/widgets_directory/base_widgets.dart';

class WidgetsDirectory {
  final String title;
  final String subtitle;
  final String routeName;
  final Widget widgetChild;

  const WidgetsDirectory(this.title, this.subtitle,
      {this.routeName = "",this.widgetChild});


}
