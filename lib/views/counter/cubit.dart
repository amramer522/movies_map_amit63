import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_amit63/views/counter/states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterStates());
  int count = 1;

  void minus() {
    count--;
    emit(CounterUpdateState());
  }

  void plus() {
    count++;
    emit(CounterUpdateState());
  }

  bool isOn = false;

  void toggleSwitch(){
    isOn  =!isOn;
    emit(CounterToggleSwitchState());
  }


}
