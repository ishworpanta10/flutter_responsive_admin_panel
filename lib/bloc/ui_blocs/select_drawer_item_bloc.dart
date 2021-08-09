import 'package:flutter_bloc/flutter_bloc.dart';

class SelectDrawerItemBloc extends Bloc<int, int> {
  SelectDrawerItemBloc() : super(0);

  @override
  Stream<int> mapEventToState(int event) async* {
    yield event;
  }
}
