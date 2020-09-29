import 'package:currency_converter/ui/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData appTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: AppColors.primaryColor,
  primaryColorLight: AppColors.primaryColorLight,
  primaryColorDark: AppColors.primaryColorDark,
  accentColor: AppColors.accentColor,
  scaffoldBackgroundColor: AppColors.white
);

ThemeData lightAppTheme = appTheme.copyWith(brightness: Brightness.light);
ThemeData darkAppTheme = appTheme.copyWith(brightness: Brightness.light);

SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
  systemNavigationBarColor: AppColors.blue50,
  statusBarColor: AppColors.blue50,
  statusBarIconBrightness: Brightness.dark
);
