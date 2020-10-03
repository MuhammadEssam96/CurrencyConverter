import 'package:auto_size_text/auto_size_text.dart';
import 'package:currency_converter/cubits/result_field_cubit.dart';
import 'package:currency_converter/data/models/currency.dart';
import 'package:currency_converter/cubits/number_field_cubit.dart';
import 'package:currency_converter/cubits/currency_cubit.dart';
import 'package:currency_converter/ui/values/colors.dart';
import 'package:currency_pickers/country.dart';
import 'package:currency_pickers/currency_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CurrencyWidgetType {from, to}

class CurrencySelectorAndNumberFieldWidget extends StatelessWidget {
  final CurrencyWidgetType currencyWidgetType;

  const CurrencySelectorAndNumberFieldWidget(this.currencyWidgetType);

  @override
  Widget build(BuildContext context) {
    String type;
    switch (currencyWidgetType) {
      case CurrencyWidgetType.from:
        type = "From";
        break;
      case CurrencyWidgetType.to:
        type = "To    ";
    }
    BlocProvider.of<OriginalCurrencyCubit>(context).pickAnotherCurrency(const Currency("USD"));
    BlocProvider.of<ConvertedCurrencyCubit>(context).pickAnotherCurrency(const Currency("EGP"));
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.15,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: AppColors.blue400,
            blurRadius: 7,
          ),
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(type),
                const SizedBox(width: 8.0,),
                CurrencyPickerDropdown(
                  initialValue: currencyWidgetType == CurrencyWidgetType.from ? "US" : "EG",
                  itemBuilder: (Country country){
                    final String currencyCode = country.currencyCode;
                    return Row(
                      children: <Widget>[
                        CurrencyPickerUtils.getDefaultFlagImage(country),
                        const SizedBox(width: 8.0,),
                        Text(currencyCode),
                      ],
                    );
                  },
                  onValuePicked: (Country country) {
                    final Currency currency = Currency(country.currencyCode);
                    if (currencyWidgetType == CurrencyWidgetType.from){
                      BlocProvider.of<OriginalCurrencyCubit>(context).pickAnotherCurrency(currency);
                    } else {
                      BlocProvider.of<ConvertedCurrencyCubit>(context).pickAnotherCurrency(currency);
                    }
                  },
                ),
              ],
            ),
            if (currencyWidgetType == CurrencyWidgetType.from) BlocConsumer<NumberFieldCubit, NumberFieldState>(
              listener: (BuildContext context, NumberFieldState state){
                if (state is NumberFieldMaxLimitReachedError){
                  Scaffold.of(context).removeCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(const SnackBar(content: Text("Max digit number reached!")));
                }
              },
              builder: (BuildContext context, NumberFieldState state){
                String text;
                if (state is NumberFieldInitialState) {
                  text = "0";
                } else {
                  text = state.number;
                }
                return Expanded(
                  child: AutoSizeText(
                    text,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 36.0,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                );
              }
            ) else BlocBuilder<ResultFieldCubit, ResultFieldState>(
              builder: (BuildContext context, ResultFieldState state){
                String text;
                if (state is ResultFieldInitialState) {
                  text = "0";
                } else {
                  text = state.number;
                }
                return Expanded(
                  child: AutoSizeText(
                    text,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 36.0,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}