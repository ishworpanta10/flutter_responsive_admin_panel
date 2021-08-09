import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_admin_panel/cubit/cubit.dart';
import 'package:responsive_admin_panel/model/models.dart';

import '../../constants/constants.dart';
import '../../responsive_layout.dart';

class PanelLeftPage extends StatelessWidget {
  final List<Todo> _todoList = [
    Todo(name: "Purchase Paper"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              color: Constants.purpleLight,
              child: Container(
                decoration: const BoxDecoration(
                  color: Constants.purpleDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
              ),
            ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: Constants.kPadding / 2,
                    right: Constants.kPadding / 2,
                    top: Constants.kPadding / 2,
                  ),
                  child: Card(
                    color: Constants.purpleLight,
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    child: Container(
                      width: double.infinity,
                      child: const ListTile(
                        title: Text(
                          "Product Sold",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "20% of Products Sold",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Chip(
                          label: Text(
                            "4,500",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // TODO: Graph 1
                // TODO: Graph 2
                Padding(
                  padding: const EdgeInsets.only(
                    left: Constants.kPadding / 2,
                    right: Constants.kPadding / 2,
                    top: Constants.kPadding / 2,
                    bottom: Constants.kPadding,
                  ),
                  child: Card(
                    color: Constants.purpleLight,
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    child: Column(
                      children: [
                        ...List.generate(
                          _todoList.length,
                          (index) {
                            final todo = _todoList[index];
                            return BlocBuilder<ToggleCheckBoxCubit, bool>(
                              builder: (context, state) {
                                todo.isEnable = state;
                                return CheckboxListTile(
                                  value: state,
                                  onChanged: (value) {
                                    BlocProvider.of<ToggleCheckBoxCubit>(context).toggle(value: value!);
                                  },
                                  title: Text(
                                    todo.name,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
