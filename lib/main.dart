import 'package:currency_converter/ui/screens/home_screen.dart';
import 'package:currency_converter/ui/screens/splash_screen.dart';
import 'package:currency_converter/ui/values/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(CurrencyConverterApp());

class CurrencyConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(AppThemes.systemUiOverlayStyle);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Currency Converter",
      theme: AppThemes.appTheme,
      initialRoute: "/SplashScreen",
      routes: {
        "/SplashScreen" : (context) => SplashScreen(),
        "/HomeScreen" : (context) => HomeScreen(),
      },
    );
  }
}