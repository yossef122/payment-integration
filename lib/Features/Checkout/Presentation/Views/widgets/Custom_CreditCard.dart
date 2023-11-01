import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  CustomCreditCard(
      {Key? key, required this.formKey, required this.autoValidateMode})
      : super(key: key);
  final GlobalKey<FormState> formKey;
  AutovalidateMode? autoValidateMode;

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String? cardNumber = "";

  String? expiryDate = "";

  String? cardHolderName = "";

  String? cvvCode = "";

  bool? showBackView = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber!,
          expiryDate: expiryDate!,
          cardHolderName: cardHolderName!,
          cvvCode: cvvCode!,
          showBackView: showBackView!,
          onCreditCardWidgetChange: (val) {},
          isHolderNameVisible: true,
        ),
        CreditCardForm(
          autovalidateMode: widget.autoValidateMode,
          cardNumber: cardNumber!,
          expiryDate: expiryDate!,
          cardHolderName: cardHolderName!,
          cvvCode: cvvCode!,
          onCreditCardModelChange: (cardModel) {
            cardNumber = cardModel.cardNumber;
            expiryDate = cardModel.expiryDate;
            cardHolderName = cardModel.cardHolderName;
            cvvCode = cardModel.cvvCode;
            showBackView = cardModel.isCvvFocused;
            setState(() {});
          },
          formKey: widget.formKey,
        ),
      ],
    );
  }
}
