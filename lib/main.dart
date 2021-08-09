import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/ui_blocs/select_drawer_item_bloc.dart';
import 'constants/constants.dart';
import 'cubit/cubit.dart';
import 'widget_tree.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SelectDrawerItemBloc(),
        ),
        BlocProvider(
          create: (_) => SelectButtonAppBarCubit(),
        ),
        BlocProvider(
          create: (_) => ToggleCheckBoxCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Responsive Admin Panel',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Constants.purpleDark,
          canvasColor: Constants.purpleLight,
        ),
        home: WidgetTree(),
      ),
    );
  }
}
