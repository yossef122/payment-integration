// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:payment/Core/utils/styles.dart';

class OrderInfoItem extends StatelessWidget {
  OrderInfoItem({Key? key, required this.value, required this.title})
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
          style: Styles.style18,
        ),
        const Spacer(),
        Text(
          value!,
          textAlign: TextAlign.center,
          style: Styles.style18,
        ),
      ],
    );
  }
}
