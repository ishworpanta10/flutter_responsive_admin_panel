import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/constants.dart';
import 'cubit/cubit.dart';
import 'responsive_layout.dart';
import 'screens/drawer.dart';
import 'screens/screens.dart';
import 'widgets/custom_appbar/custom_appbar.dart';

class WidgetTree extends StatelessWidget {
  final List<Widget> _icons = const [
    Icon(Icons.add, size: 30),
    Icon(Icons.list, size: 30),
    Icon(Icons.compare_arrows, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: (ResponsiveLayout.isTinyLimit(context) || ResponsiveLayout.isTinyHeightLimit(context)) ? const SizedBox.shrink() : CustomAppBar(),
      ),
      drawer: ResponsiveLayout.isComputer(context) ? null : DrawerPage(),
      body: BlocBuilder<NavBarToggleCubit, int>(
        builder: (context, navIndex) {
          return ResponsiveLayout(
            tinyWidget: const SizedBox.shrink(),
            phoneWidget: navIndex == 0
                ? PanelLeftPage()
                : navIndex == 1
                    ? PanelCenterPage()
                    : PanelRightPage(),
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
          );
        },
      ),
      bottomNavigationBar: ResponsiveLayout.isPhone(context)
          ? BlocBuilder<NavBarToggleCubit, int>(
              builder: (context, state) {
                return CurvedNavigationBar(
                  index: state,
                  backgroundColor: Constants.purpleDark,
                  color: Constants.blueLight,
                  items: _icons,
                  onTap: (index) {
                    context.read<NavBarToggleCubit>().toggle(index: index);
                  },
                );
              },
            )
          : const SizedBox.shrink(),
    );
  }
}
