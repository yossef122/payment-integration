import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:payment/Core/Widgets/Custom_button.dart';
import 'package:payment/Features/Checkout/Presentation/Views/success_view.dart';
import 'package:payment/Features/Checkout/Presentation/Views/widgets/Custom_CreditCard.dart';
import 'package:payment/Features/Checkout/Presentation/Views/widgets/Payment_Method_ListView.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({Key? key}) : super(key: key);

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: PaymentMethodListView(),
        ),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            formKey: formKey,
            autoValidateMode: autoValidateMode,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 12,
                left: 16,
                right: 16,
              ),
              child: CustomButton(
                text: "Pay",
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SuccessView();
                        },
                      ),
                    );

                    log("payment");
                  } else {
                    print(autoValidateMode);
                    // if (autoValidateMode == AutovalidateMode.disabled) {
                    // } else {
                    autoValidateMode = AutovalidateMode.always;
                    // }
                    setState(() {});
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
