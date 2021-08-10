import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarToggleCubit extends Cubit<int> {
  NavBarToggleCubit() : super(0);

  void toggle({required int index}) {
    emit(index);
  }
}
