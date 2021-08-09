import 'package:flutter_bloc/flutter_bloc.dart';

class SelectButtonAppBarCubit extends Cubit<int> {
  SelectButtonAppBarCubit() : super(0);

  void selectButton(int index) {
    emit(index);
  }
}
