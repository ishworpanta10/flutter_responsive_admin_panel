import 'package:flutter/material.dart';

import 'responsive_layout.dart';
import 'screens/drawer.dart';
import 'widgets/widgets.dart';

class WidgetTree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: (ResponsiveLayout.isTinyLimit(context) || ResponsiveLayout.isTinyHeightLimit(context)) ? Container() : customAppBar,
      ),
      drawer: ResponsiveLayout.isComputer(context) ? null : DrawerPage(),
      body: ResponsiveLayout(
        tinyWidget: Container(color: Colors.red, child: const Text('Tiny')),
        phoneWidget: Container(color: Colors.blue, child: const Text('Phone')),
        tabletWidget: Container(color: Colors.teal, child: const Text('Tablet')),
        largeTabletWidget: Container(color: Colors.orange, child: const Text('Large Tablet')),
        computerWidget: Container(color: Colors.green, child: const Text('Computer')),
      ),
    );
  }
}
