import 'package:bloc/bloc.dart';
import 'package:currency_converter/cubits/cubits_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'currency_converter_app.dart';

void main() {
  Bloc.observer = CubitsObserver();
  runApp(CurrencyConverterApp());
}