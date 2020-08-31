import 'package:currency_converter/ui/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemes {
  static ThemeData appTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryColorLight,
    primaryColorDark: AppColors.primaryColorDark,
    accentColor: AppColors.accentColor,
    scaffoldBackgroundColor: AppColors.white
  );

  static ThemeData lightAppTheme = appTheme.copyWith(brightness: Brightness.light);
  static ThemeData darkAppTheme = appTheme.copyWith(brightness: Brightness.light);

  static SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.white,
    statusBarColor: AppColors.white,
    statusBarIconBrightness: Brightness.dark
  );
}