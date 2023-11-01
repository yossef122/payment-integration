import 'package:flutter/material.dart';
import 'package:payment/Core/utils/styles.dart';

class TotalPriceOfOrder extends StatelessWidget {
  TotalPriceOfOrder({Key? key, required this.value, required this.title})
      : super(key: key);
  String? title;
  String? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title!,
          textAlign: TextAlign.center,
          style: Styles.style24,
        ),
        const Spacer(),
        Text(
          value!,
          textAlign: TextAlign.center,
          style: Styles.style24,
        ),
      ],
    );
  }
}
