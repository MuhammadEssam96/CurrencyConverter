import 'package:currency_converter/cubits/number_field_cubit.dart';
import 'package:currency_converter/ui/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumPadButtonWidget extends StatelessWidget {
  final String text;

  const NumPadButtonWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.15,
      height: MediaQuery.of(context).size.width * 0.15,
      child: RawMaterialButton(
        fillColor: text != "<" ? AppColors.white : AppColors.redA700,
        shape: const CircleBorder(),
        elevation: 6,
        onPressed: (){
          text == "<" ? pressEraseButton(context) : text == "." ? pressDotButton(context) : pressButton(context);
        },
        child: text != "<" ? Text(
          text,
          style: const TextStyle(
            fontSize: 36,
            color: AppColors.blue400
          ),
        ) : const Icon(Icons.backspace, color: AppColors.white,),
      )
    );
  }

  void pressButton(BuildContext context){
    final numberFieldCubit = BlocProvider.of<NumberFieldCubit>(context);
    if (numberFieldCubit.state is NumberFieldInitialState) {
      numberFieldCubit.addFirstNumber(text);
    } else {
      final String currentNumber = numberFieldCubit.state.number;
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


