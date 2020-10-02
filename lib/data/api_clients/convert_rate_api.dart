import 'dart:io';
import 'package:currency_converter/data/models/convert_rate.dart';
import 'package:bloc/bloc.dart';
import 'package:currency_converter/cubits/convert_rate_cubit.dart';
import 'package:currency_converter/data/api_clients/secrets/currency_api_keys.dart';
import 'package:http/http.dart' as http;

class ConvertRateAPI {
  static const String host = "currency-exchange.p.rapidapi.com";
  static const String apiKey = CurrencyAPIKeys.apiKey;

  Future<http.Response> getConvertRate(String fromCurrency, String toCurrency) async {
    return http.get(
      "https://$host/exchange?q=1.0&from=$fromCurrency&to=$toCurrency",
      headers: {
        "x-rapidapi-host" : host,
        "x-rapidapi-key" : apiKey,
      }
    );
  }
}

class CustomException implements Exception {
  final String _message;
  final String _prefix;

  CustomException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String message]) : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([String message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([String message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}