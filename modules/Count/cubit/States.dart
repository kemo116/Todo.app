// ignore_for_file: file_names

abstract class CountStates{}
class CountInitialState extends CountStates{}
class CountMinusState extends CountStates{
  final int count ;
  CountMinusState(this.count);
}
class CountPlusState extends CountStates{
  final int count ;
  CountPlusState(this.count);
}

