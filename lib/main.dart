import 'package:flutter/material.dart';
import 'package:responsive_admin_panel/constants/constants.dart';
import 'package:responsive_admin_panel/widget_tree.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue, scaffoldBackgroundColor: Constants.purpleDark,
        canvasColor: Colors.red, //Constants.purpleLight,
      ),
      home: WidgetTree(),
    );
  }
}
