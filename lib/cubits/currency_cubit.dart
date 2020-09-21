import 'package:currency_converter/data/models/currency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OriginalCurrencyCubit extends Cubit<CurrencyState>{
  OriginalCurrencyCubit() : super(CurrencyInitialState());

  void pickAnotherCurrency(Currency currency){
    print("Currency");
    emit(CurrencyNewState(currency));
  }
}

class ConvertedCurrencyCubit extends Cubit<CurrencyState> {
  ConvertedCurrencyCubit() : super(CurrencyInitialState());

  void pickAnotherCurrency(Currency currency){
    print("Currency");
    emit(CurrencyNewState(currency));
  }
}

abstract class CurrencyState {
  const CurrencyState();
  Currency get currency;
}

class CurrencyInitialState extends CurrencyState{
  Currency get currency => Currency("EGP");
}

class CurrencyNewState extends CurrencyState {
  final Currency _currency;
  const CurrencyNewState(this._currency);

  Currency get currency => _currency;
}