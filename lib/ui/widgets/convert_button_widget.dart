import 'package:currency_converter/cubits/convert_rate_cubit.dart';
import 'package:currency_converter/cubits/currency_cubit.dart';
import 'package:currency_converter/cubits/number_field_cubit.dart';
import 'package:currency_converter/cubits/result_field_cubit.dart';
import 'package:currency_converter/ui/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConvertButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      color: AppColors.blue400,
      child: Text(
        "CONVERT",
        style: TextStyle(
          color: AppColors.white,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50)
      ),
      onPressed: () async => convertCurrencies(context),
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
