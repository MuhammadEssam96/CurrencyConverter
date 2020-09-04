import 'package:auto_size_text/auto_size_text.dart';
import 'package:currency_converter/cubit/number_field_cubit.dart';
import 'package:currency_converter/ui/values/colors.dart';
import 'package:currency_pickers/country.dart';
import 'package:currency_pickers/currency_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CurrencyWidgetType {From, To}

class CurrencySelectorAndNumberFieldWidget extends StatelessWidget {
  final CurrencyWidgetType currencyWidgetType;

  const CurrencySelectorAndNumberFieldWidget(this.currencyWidgetType);

  @override
  Widget build(BuildContext context) {
    String type;
    switch (currencyWidgetType) {
      case CurrencyWidgetType.From:
        type = "From";
        break;
      case CurrencyWidgetType.To:
        type = "To    ";
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.15,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: AppColors.blue400,
            blurRadius: 7
          ),
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(type),
                SizedBox(width: 8.0,),
                CurrencyPickerDropdown(
                  initialValue: "EG",
                  itemBuilder: (Country country){
                    return Container(
                      child: Row(
                        children: <Widget>[
                          CurrencyPickerUtils.getDefaultFlagImage(country),
                          SizedBox(width: 8.0,),
                          Text("${country.currencyCode}"),
                        ],
                      ),
                    );
                  },
                  onValuePicked: (Country country) {

                  },
                ),
              ],
            ),
            currencyWidgetType == CurrencyWidgetType.From ? BlocBuilder<NumberFieldCubit, NumberFieldState>(
              builder: (context, state){
                String text;
                if (state is NumberFieldInitialState) {
                  text = "0";
                } else if (state is NumberFieldMaxLimitReachedError){
                  text = state.number;
                  //TODO: show snackbar for error
                }  else {
                  text = state.number;
                }
                return Expanded(
                  child: AutoSizeText(
                    text,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 36.0,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                );
              }
            ) : Text(
              "sth",
              style: TextStyle(
                fontSize: 36.0
              ),
            )
          ],
        ),
      ),
    );
  }
}