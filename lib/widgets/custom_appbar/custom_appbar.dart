import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constants.dart';
import '../../cubit/cubit.dart';
import '../../responsive_layout.dart';

List<String> _buttonNames = ["Overview", "Revenue", "Sales", "Control"];

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.purpleLight,
      child: Row(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              margin: const EdgeInsets.only(left: Constants.kPadding * 2.5),
              height: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.pink,
                radius: 30,
                child: FlutterLogo(size: 40),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(bottom: Constants.kPadding),
              child: IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
          const Spacer(),
          if (ResponsiveLayout.isComputer(context))
            ...List.generate(
              _buttonNames.length,
              (index) {
                final buttonName = _buttonNames[index];
                return TextButton(
                  onPressed: () {
                    BlocProvider.of<SelectButtonAppBarCubit>(context).selectButton(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(Constants.kPadding * 2),
                    child: BlocBuilder<SelectButtonAppBarCubit, int>(
                      builder: (context, state) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              buttonName,
                              style: TextStyle(
                                color: index == state ? Colors.white : Colors.white70,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(Constants.kPadding / 2),
                              width: 60,
                              height: 2,
                              decoration: state == index
                                  ? const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.blue,
                                          Colors.teal,
                                        ],
                                      ),
                                    )
                                  : null,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              },
            )
          else
            Padding(
              padding: const EdgeInsets.all(Constants.kPadding * 2),
              child: BlocBuilder<SelectButtonAppBarCubit, int>(
                builder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _buttonNames[index],
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.all(Constants.kPadding / 2),
                          width: 60,
                          height: 2,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue,
                                Colors.teal,
                              ],
                            ),
                          )),
                    ],
                  );
                },
              ),
            ),
          const Spacer(),
          IconButton(
            color: Colors.white,
            iconSize: 30,
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          Stack(
            children: [
              IconButton(
                color: Colors.white,
                iconSize: 30,
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_outlined),
              ),
              const Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 8,
                  child: Text(
                    "5",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (!ResponsiveLayout.isPhone(context))
            Container(
              margin: const EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                backgroundColor: Constants.orangeDark,
                radius: 26,
                child: FlutterLogo(size: 30),
              ),
            )
        ],
      ),
    );
  }
}
