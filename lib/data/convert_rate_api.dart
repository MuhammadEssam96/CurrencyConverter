import 'package:currency_converter/data/secrets/currency_api_keys.dart';

class ConvertRateAPI {
  static const String host = "currency-exchange.p.rapidapi.com";
  static const String apiKey = CurrencyAPIKeys.apiKey;

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