import 'package:flutter_bloc/flutter_bloc.dart';

class ResultFieldCubit extends Cubit<ResultFieldState>{
  ResultFieldCubit() : super(ResultFieldInitialState());

  void showResult({String from, String rate}){
    double result = double.parse(from) * double.parse(rate);
    emit(ResultFieldNewState(result.toStringAsFixed(2)));
  }
}

abstract class ResultFieldState {
  const ResultFieldState();
  String get number => null;
}

class ResultFieldInitialState extends ResultFieldState {
  const ResultFieldInitialState();
}

class ResultFieldNewState extends ResultFieldState {
  final String _number;
  const ResultFieldNewState(this._number);

  @override
  String get number => _number;
}

class ResultFieldErrorState extends ResultFieldState {
  const ResultFieldErrorState();
}