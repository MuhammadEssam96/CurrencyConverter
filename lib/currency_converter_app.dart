import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/convert_rate_cubit.dart';
import 'cubits/currency_cubit.dart';
import 'cubits/number_field_cubit.dart';
import 'cubits/result_field_cubit.dart';

import 'ui/screens/home_screen.dart';
import 'ui/screens/splash_screen.dart';

import 'ui/values/themes.dart' as app_themes;

class CurrencyConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(app_themes.systemUiOverlayStyle);
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
        theme: app_themes.appTheme,
        initialRoute: "/SplashScreen",
        routes: {
          "/SplashScreen" : (context) => SplashScreen(),
          "/HomeScreen" : (context) => HomeScreen(),
        },
      ),
    );
  }
}