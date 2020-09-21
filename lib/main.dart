import 'package:bloc/bloc.dart';
import 'package:currency_converter/cubits/convert_rate_cubit.dart';
import 'package:currency_converter/cubits/cubits_observer.dart';
import 'package:currency_converter/cubits/number_field_cubit.dart';
import 'package:currency_converter/cubits/currency_cubit.dart';
import 'package:currency_converter/cubits/result_field_cubit.dart';
import 'package:currency_converter/ui/screens/home_screen.dart';
import 'package:currency_converter/ui/screens/splash_screen.dart';
import 'package:currency_converter/ui/values/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = CubitsObserver();
  runApp(CurrencyConverterApp());
}

class CurrencyConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(AppThemes.systemUiOverlayStyle);
    return MultiBlocProvider(
      providers: [
        BlocProvider<NumberFieldCubit>(create: (context) => NumberFieldCubit()),
        BlocProvider<OriginalCurrencyCubit>(create: (context) => OriginalCurrencyCubit()),
        BlocProvider<ConvertedCurrencyCubit>(create: (context) => ConvertedCurrencyCubit()),
        BlocProvider<ConvertRateCubit>(create: (context) => ConvertRateCubit()),
        BlocProvider<ResultFieldCubit>(create: (context) => ResultFieldCubit()),
      ],
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