import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleCheckBoxCubit extends Cubit<bool> {
  ToggleCheckBoxCubit() : super(false);

  void toggle({required bool value}) {
    emit(value);
  }
}
