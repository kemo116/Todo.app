import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/modules/Count/cubit/States.dart';

class CountCubit extends Cubit<CountStates>{
  CountCubit() : super (CountInitialState());
  static CountCubit get(context)=> BlocProvider.of(context);

  int count =1;
  void minus(){
    count--;
    emit(CountMinusState(count));
  }
  void plus(){
    count++;
    emit(CountPlusState(count));
  }

}