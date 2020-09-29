import 'dart:io';
import 'package:currency_converter/data/convert_rate_api.dart';
import 'package:currency_converter/data/models/convert_rate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ConvertRateCubit extends Cubit<ConvertRateState>{
  ConvertRateCubit() : super(const ConvertRateInitialState());
  static String host = ConvertRateAPI.host;
  static String apiKey = ConvertRateAPI.apiKey;

  Future<void> getConvertRate(String fromCurrency, String toCurrency) async {
    if (fromCurrency == toCurrency){
      emit(const ConvertRateNewState(ConvertRate(1)));
      return;
    }

    emit(ConvertRateLoadingState());

    try {
      await http.get(
        "https://$host/exchange?q=1.0&from=$fromCurrency&to=$toCurrency",
        headers: {
          "x-rapidapi-host" : host,
          "x-rapidapi-key" : apiKey,
        }
      ).then((response) => _response(response));

    } on SocketException {
      emit(ConvertRateErrorState());
      throw FetchDataException('No Internet connection');
    }
  }

  void _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final responseJson = double.parse(response.body);
        final ConvertRate convertRate = ConvertRate(responseJson);
        emit(ConvertRateNewState(convertRate));
        break;
      case 400:
        emit(ConvertRateErrorState());
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        emit(ConvertRateErrorState());
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        emit(ConvertRateErrorState());
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
  @override
  ConvertRate get convertRate => null;
}