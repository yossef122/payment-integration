import 'package:flutter/material.dart';
import 'package:payment/Core/utils/styles.dart';

AppBar buildAppBar({ final String? title, void Function()? onPressed}) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    leading: Center(
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 40,
        ),
      ),
    ),
    title: Text(
      title??"",
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
    centerTitle: true,
  );
}
