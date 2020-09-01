import 'package:currency_converter/ui/values/colors.dart';
import 'package:flutter/material.dart';

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
        },
      )
    );
  }
}
