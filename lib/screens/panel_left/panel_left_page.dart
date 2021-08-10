import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constants.dart';
import '../../cubit/cubit.dart';
import '../../model/models.dart';
import '../../responsive_layout.dart';
import '../screens.dart';

class PanelLeftPage extends StatelessWidget {
  final List<Todo> _todoList = [
    Todo(name: "Purchase Paper"),
    Todo(name: "Sales Paper", isEnable: false),
    Todo(name: "Hiring Employee"),
    Todo(name: "Marketing campaign", isEnable: false),
    Todo(name: "Selling digital goods", isEnable: false),
    Todo(name: "Finish all client Applications"),
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
                    top: Constants.kPadding,
                    bottom: Constants.kPadding,
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
                LineChartSample2(),
                // TODO: Graph 2
                PieChartSample2(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: Constants.kPadding / 2,
                    right: Constants.kPadding / 2,
                    top: Constants.kPadding,
                    bottom: Constants.kPadding,
                  ),
                  child: Card(
                    color: Constants.purpleLight,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    elevation: 3,
                    child: Column(
                      children: [
                        ...List.generate(
                          _todoList.length,
                          (index) {
                            final todo = _todoList[index];
                            return BlocBuilder<ToggleCheckBoxCubit, int>(
                              builder: (context, state) {
                                return CheckboxListTile(
                                  value: todo.isEnable,
                                  onChanged: (value) {
                                    BlocProvider.of<ToggleCheckBoxCubit>(context).toggle(value: index);
                                    todo.isEnable = value;
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
