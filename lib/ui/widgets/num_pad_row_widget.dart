import 'package:currency_converter/ui/widgets/num_pad_button_widget.dart';
import 'package:flutter/material.dart';

class NumPadRowWidget extends StatelessWidget {
  final List<String> buttons;

  const NumPadRowWidget(this.buttons);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        NumPadButtonWidget(buttons[0]),
        NumPadButtonWidget(buttons[1]),
        NumPadButtonWidget(buttons[2]),
      ],
    );
  }
}
