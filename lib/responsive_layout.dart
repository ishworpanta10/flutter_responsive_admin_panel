import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    required this.tinyWidget,
    required this.phoneWidget,
    required this.tabletWidget,
    required this.largeTabletWidget,
    required this.computerWidget,
  });
  final Widget tinyWidget;
  final Widget phoneWidget;
  final Widget tabletWidget;
  final Widget largeTabletWidget;
  final Widget computerWidget;

  static const int tinyHeightLimit = 100;
  static const int tinyLimit = 270;
  static const int phoneLimit = 550;
  static const int tabletLimit = 800;
  static const int largeTabletLimit = 1100;

  static bool isTinyHeightLimit(BuildContext context) => MediaQuery.of(context).size.height < tinyHeightLimit;
  static bool isTinyLimit(BuildContext context) => MediaQuery.of(context).size.width < tinyLimit;
  static bool isPhone(BuildContext context) => MediaQuery.of(context).size.width < phoneLimit && MediaQuery.of(context).size.width >= tinyLimit;
  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width < tabletLimit && MediaQuery.of(context).size.width >= phoneLimit;
  static bool isLargeTablet(BuildContext context) => MediaQuery.of(context).size.width < largeTabletLimit && MediaQuery.of(context).size.width >= tabletLimit;
  static bool isComputer(BuildContext context) => MediaQuery.of(context).size.width >= largeTabletLimit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < tinyLimit || constraints.maxHeight < tinyHeightLimit) {
          return tinyWidget;
        } else if (constraints.maxWidth < phoneLimit) {
          return phoneWidget;
        } else if (constraints.maxWidth < tabletLimit) {
          return tabletWidget;
        } else if (constraints.maxWidth < largeTabletLimit) {
          return largeTabletWidget;
        } else {
          return computerWidget;
        }
      },
    );
  }
}
