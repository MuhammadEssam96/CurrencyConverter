import 'package:currency_converter/ui/values/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context,  "/HomeScreen")
    );

    return Container(
      color: AppColors.blue50,
      child: Center(
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}
