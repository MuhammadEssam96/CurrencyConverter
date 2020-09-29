import 'package:currency_converter/cubits/convert_rate_cubit.dart';
import 'package:currency_converter/ui/values/colors.dart';
import 'package:currency_converter/ui/widgets/convert_button_widget.dart';
import 'package:currency_converter/ui/widgets/currency_selector_number_field_widget.dart';
import 'package:currency_converter/ui/widgets/num_pad_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue50,
      appBar: AppBar(
        backgroundColor: AppColors.blue50,
        brightness: Brightness.light,
        elevation: 0.0,
        title: const Text(
          "Currency Converter",
          style: TextStyle(
            color: AppColors.blue400
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const CurrencySelectorAndNumberFieldWidget(CurrencyWidgetType.from),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.swap_vert,),
                  ),
                  const CurrencySelectorAndNumberFieldWidget(CurrencyWidgetType.to),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BlocBuilder<ConvertRateCubit, ConvertRateState>(
                      builder: (context, state) {
                        if (state is ConvertRateLoadingState){
                          return const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ConvertButton();
                        }
                      }
                    ),
                  )
                ],
              ),
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    NumPadRowWidget(["1", "2", "3"]),
                    SizedBox(height: 16.0),
                    NumPadRowWidget(["4", "5", "6"]),
                    SizedBox(height: 16.0),
                    NumPadRowWidget(["7", "8", "9"]),
                    SizedBox(height: 16.0),
                    NumPadRowWidget([".", "0", "<"]),
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}