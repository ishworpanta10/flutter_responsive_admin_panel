import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/ui_blocs/select_drawer_item_bloc.dart';
import '../constants/constants.dart';
import '../model/models.dart';
import '../responsive_layout.dart';

List<ButtonsInfo> _buttonNames = [
  ButtonsInfo(title: "Home", icon: Icons.home),
  ButtonsInfo(title: "Setting", icon: Icons.settings),
  ButtonsInfo(title: "Notifications", icon: Icons.notifications),
  ButtonsInfo(title: "Contacts", icon: Icons.contact_phone_rounded),
  ButtonsInfo(title: "Sales", icon: Icons.sell),
  ButtonsInfo(title: "Marketing", icon: Icons.mark_email_read),
  ButtonsInfo(title: "Security", icon: Icons.verified_user),
  ButtonsInfo(title: "Users", icon: Icons.supervised_user_circle_rounded),
];

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: Constants.kPadding * 2),
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  "Admin Menu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                trailing: !ResponsiveLayout.isComputer(context)
                    ? IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          context.read<SelectDrawerItemBloc>().add(-1);
                        },
                        icon: const Icon(Icons.close, color: Colors.white),
                      )
                    : null,
              ),
              ...List.generate(
                _buttonNames.length,
                (index) => Column(
                  children: [
                    BlocBuilder<SelectDrawerItemBloc, int>(
                      builder: (context, selectedItem) {
                        return Container(
                          decoration: index == selectedItem
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    colors: [
                                      Constants.redDark.withOpacity(0.9),
                                      Constants.orangeDark.withOpacity(0.9),
                                    ],
                                  ),
                                )
                              : null,
                          child: ListTile(
                            title: Text(
                              _buttonNames[index].title,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            leading: Padding(
                              padding: const EdgeInsets.all(Constants.kPadding),
                              child: Icon(
                                _buttonNames[index].icon,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              context.read<SelectDrawerItemBloc>().add(index);
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        );
                      },
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
