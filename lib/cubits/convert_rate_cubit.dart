import 'dart:convert';
import 'dart:io';
import 'package:currency_converter/data/api_clients/convert_rate_api.dart';
import 'package:currency_converter/data/models/convert_rate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConvertRateCubit extends Cubit<ConvertRateState>{
  ConvertRateCubit() : super(const ConvertRateInitialState());

  Future<void> getConvertRate(String fromCurrency, String toCurrency) async {
    if (fromCurrency == toCurrency){
      emit(const ConvertRateNewState(ConvertRate(1)));
      return;
    }

    emit(ConvertRateLoadingState());

    try {
      await getConvertRateBasedOn(fromCurrency, toCurrency);

    } on SocketException {
      emit(const ConvertRateErrorState("Error fetching convert rate. Check your internet connection"));
      throw FetchDataException('No Internet connection');
    }
  }

  Future<void> getConvertRateBasedOn(String fromCurrency, String toCurrency) async {
    final response = await ConvertRateAPI().getRatesBasedOn(fromCurrency);

    switch (response.statusCode){
      case 200:
        final conversionRates = jsonDecode(response.body) as Map<String, dynamic>;
        final rate = double.parse(conversionRates["conversion_rates"][toCurrency].toString());
        final ConvertRate convertRate = ConvertRate(rate);
        emit(ConvertRateNewState(convertRate));
        break;
      case 400:
        emit(const ConvertRateErrorState("Error fetching convert rate. Error 400 Bad Request"));
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        emit(const ConvertRateErrorState("Error fetching convert rate. Error 403 Unauthorized"));
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        emit(const ConvertRateErrorState("Error fetching convert rate. Error 500 Internal Server Error"));
        throw FetchDataException('Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

abstract class ConvertRateState {
  const ConvertRateState();
  ConvertRate get convertRate => const ConvertRate(1);
}

class ConvertRateInitialState extends ConvertRateState {
  const ConvertRateInitialState();
}

class ConvertRateLoadingState extends ConvertRateState{
  @override
  ConvertRate get convertRate => null;
}

class ConvertRateNewState extends ConvertRateState {
  final ConvertRate _convertRate;
  const ConvertRateNewState(this._convertRate);

  @override
  ConvertRate get convertRate => _convertRate;
}

class ConvertRateErrorState extends ConvertRateState{
  final String message;
  const ConvertRateErrorState(this.message);

  @override
  ConvertRate get convertRate => null;
}