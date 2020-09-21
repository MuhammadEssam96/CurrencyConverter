import 'package:currency_converter/cubits/number_field_cubit.dart';
import 'package:currency_converter/ui/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumPadButtonWidget extends StatelessWidget {
  final String text;

  const NumPadButtonWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      child: RawMaterialButton(
        fillColor: text != "<" ? AppColors.white : AppColors.redA700,
        shape: CircleBorder(),
        elevation: 6,
        child: text != "<" ? Text(
          text,
          style: TextStyle(
            fontSize: 24,
            color: AppColors.blue400
          ),
        ) : Icon(Icons.backspace, color: AppColors.white,),
        onPressed: (){
          text == "<" ? pressEraseButton(context) : text == "." ? pressDotButton(context) : pressButton(context);
        },
      )
    );
  }

  void pressButton(BuildContext context){
    final numberFieldCubit = BlocProvider.of<NumberFieldCubit>(context);
    if (numberFieldCubit.state is NumberFieldInitialState) {
      numberFieldCubit.addFirstNumber(text);
    } else {
      String currentNumber = numberFieldCubit.state.number;
      numberFieldCubit.addNumber(currentNumber, text);
    }
  }

  void pressEraseButton(BuildContext context) {
    final numberFieldCubit = BlocProvider.of<NumberFieldCubit>(context);
    final number = numberFieldCubit.state.number;

    numberFieldCubit.erase(number);
  }

  void pressDotButton(BuildContext context){
    final numberFieldCubit = BlocProvider.of<NumberFieldCubit>(context);
    if (numberFieldCubit.state is NumberFieldInitialState) {
      numberFieldCubit.addDot("0");
    }
    numberFieldCubit.addDot(numberFieldCubit.state.number);
  }
}


