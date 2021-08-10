import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleCheckBoxCubit extends Cubit<int> {
  ToggleCheckBoxCubit() : super(-1);

  void toggle({required int value}) {
    emit(value);
  }
}
