import 'package:bloc/bloc.dart';

class NumberFieldCubit extends Cubit<NumberFieldState> {
  NumberFieldCubit() : super(NumberFieldInitialState());

  void addFirstNumber(String number){
    emit(NumberFieldEditedState(number));
  }

  void addNumber(String currentNumber, String newNumber){
    String number = '$currentNumber$newNumber';

    if (number.length <= 10) {
      emit(NumberFieldEditedState(number));
    } else {
      emit(NumberFieldMaxLimitReachedError(currentNumber));
    }
  }

  void addDot(String currentNumber) {
    if(currentNumber.length <= 7 && !currentNumber.contains(".")){
      currentNumber = "$currentNumber.";
    }
    emit(NumberFieldEditedState(currentNumber));
  }

  void erase(String number){
    if(number != null && number.length > 1) {
      String newString = number.substring(0,number.length - 1);
      emit(NumberFieldEditedState(newString));
    } else {
      emit(NumberFieldInitialState());
    }
  }
}

abstract class NumberFieldState {
  const NumberFieldState();

  String get number => null;
}

class NumberFieldInitialState extends NumberFieldState {
  const NumberFieldInitialState();
  String get number => "0";
}

class NumberFieldEditedState extends NumberFieldState {
  final String _number;
  NumberFieldEditedState(this._number);

  String get number => _number;
}

class NumberFieldMaxLimitReachedError extends NumberFieldState {
  final String _number;
  NumberFieldMaxLimitReachedError(this._number);

  String get number => _number;
}