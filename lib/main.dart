import 'package:bloc/bloc.dart';
import 'package:currency_converter/cubit/observers/number_field_observer.dart';
import 'package:currency_converter/cubit/number_field_cubit.dart';
import 'package:currency_converter/ui/screens/home_screen.dart';
import 'package:currency_converter/ui/screens/splash_screen.dart';
import 'package:currency_converter/ui/values/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = NumberFieldObserver();
  runApp(CurrencyConverterApp());
}

class CurrencyConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(AppThemes.systemUiOverlayStyle);
    return BlocProvider(
      create: (context) => NumberFieldCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Currency Converter",
        theme: AppThemes.appTheme,
        initialRoute: "/SplashScreen",
        routes: {
          "/SplashScreen" : (context) => SplashScreen(),
          "/HomeScreen" : (context) => HomeScreen(),
        },
      ),
    );
  }
}