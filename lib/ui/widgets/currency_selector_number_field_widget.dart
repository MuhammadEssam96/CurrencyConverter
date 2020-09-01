import 'package:currency_converter/ui/values/colors.dart';
import 'package:currency_pickers/country.dart';
import 'package:currency_pickers/currency_pickers.dart';
import 'package:flutter/material.dart';

enum CurrencyWidgetType {From, To}

class CurrencySelectorAndNumberFieldWidget extends StatelessWidget {
  final CurrencyWidgetType currencyWidgetType;

  const CurrencySelectorAndNumberFieldWidget(this.currencyWidgetType);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.10,
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
                Text("${currencyWidgetType.toString()}"),
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
            Text(
              "00.0",
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