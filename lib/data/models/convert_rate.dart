import 'package:currency_converter/data/models/currency.dart';



class ConvertRate {
  final Currency originalCurrency;
  final Currency convertedCurrency;
  final double convertRate;

  const ConvertRate(this.convertRate, {this.originalCurrency, this.convertedCurrency});
}