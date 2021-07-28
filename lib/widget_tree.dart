import 'package:flutter/material.dart';

import 'responsive_layout.dart';

class WidgetTree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive Admin Panel"),
      ),
      body: ResponsiveLayout(
        tinyWidget: Container(height: 30, color: Colors.red, child: const Text('Tiny')),
        phoneWidget: Container(height: 30, color: Colors.blue, child: const Text('Phone')),
        tabletWidget: Container(height: 30, color: Colors.teal, child: const Text('Tablet')),
        largeTabletWidget: Container(height: 30, color: Colors.orange, child: const Text('Large Tablet')),
        computerWidget: Container(height: 30, color: Colors.green, child: const Text('Computer')),
      ),
    );
  }
}
