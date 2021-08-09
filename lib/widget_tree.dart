import 'package:flutter/material.dart';
import 'package:responsive_admin_panel/widgets/custom_appbar/custom_appbar.dart';

import 'responsive_layout.dart';
import 'screens/drawer.dart';
import 'screens/screens.dart';

class WidgetTree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: (ResponsiveLayout.isTinyLimit(context) || ResponsiveLayout.isTinyHeightLimit(context)) ? const SizedBox.shrink() : CustomAppBar(),
      ),
      drawer: ResponsiveLayout.isComputer(context) ? null : DrawerPage(),
      body: ResponsiveLayout(
        tinyWidget: Container(color: Colors.red, child: const Text('Tiny')),
        phoneWidget: PanelCenterPage(),
        tabletWidget: Row(
          children: [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
          ],
        ),
        largeTabletWidget: Row(
          children: [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
            Expanded(child: PanelRightPage()),
          ],
        ),
        computerWidget: Row(
          children: [
            Expanded(child: DrawerPage()),
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
            Expanded(child: PanelRightPage()),
          ],
        ),
      ),
    );
  }
}
