import 'package:currency_converter/ui/values/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        brightness: Brightness.light,
        elevation: 0.0,
        title: Text(
          "Currency Converter",
          style: TextStyle(
            color: AppColors.blue400
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
