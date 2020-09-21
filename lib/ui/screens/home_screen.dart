import 'package:currency_converter/cubits/convert_rate_cubit.dart';
import 'package:currency_converter/cubits/currency_cubit.dart';
import 'package:currency_converter/cubits/number_field_cubit.dart';
import 'package:currency_converter/cubits/result_field_cubit.dart';
import 'package:currency_converter/ui/values/colors.dart';
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
        title: Text(
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
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CurrencySelectorAndNumberFieldWidget(CurrencyWidgetType.From),
                  IconButton(
                    icon: Icon(Icons.swap_vert),
                    onPressed: () async => convertCurrencies(context)
                  ),
                  CurrencySelectorAndNumberFieldWidget(CurrencyWidgetType.To),
                ],
              ),
              SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
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

  Future<void> convertCurrencies(BuildContext context) async {
    final numberFieldCubit = BlocProvider.of<NumberFieldCubit>(context);
    final convertRateCubitFieldCubit = BlocProvider.of<ConvertRateCubit>(context);
    final resultFieldCubit = BlocProvider.of<ResultFieldCubit>(context);

    await convertRateCubitFieldCubit.getConvertRate(
      BlocProvider.of<OriginalCurrencyCubit>(context).state.currency.currencyCode,
      BlocProvider.of<ConvertedCurrencyCubit>(context).state.currency.currencyCode,
    );

    resultFieldCubit.showResult(
        from: numberFieldCubit.state.number,
        rate: convertRateCubitFieldCubit.state.convertRate.convertRate.toString()
    );
  }
}
