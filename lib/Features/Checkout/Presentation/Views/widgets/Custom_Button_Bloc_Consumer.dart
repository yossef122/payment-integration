import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Core/Widgets/Custom_button.dart';
import 'package:payment/Core/utils/api_keys.dart';
import 'package:payment/Core/utils/paypal/paypal_checkout_view.dart';
import 'package:payment/Features/Checkout/Presentation/Manager/payment_cubit.dart';
import 'package:payment/Features/Checkout/Presentation/Views/success_view.dart';
import 'package:payment/Features/Checkout/data/models/amount_model.dart';
import 'package:payment/Features/Checkout/data/models/item_list_model.dart';
// import 'package:payment/Features/Checkout/data/models/payment_intent_input_model.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccessState) {
          Navigator.of(context).pop();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const SuccessView();
              },
            ),
          );
        } else if (state is PaymentErrorState) {
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        // PaymentIntentInputModel paymentIntentInputModel =
        //     PaymentIntentInputModel(
        //         currency: "usd",
        //         amount: "1005",
        //         customerId: 'cus_Ou4pzK2tx33GRr');
        var amount = AmountModel(
            total: '100',
            currency: 'USD',
            details:
                Details(subtotal: '100', shipping: '0', shippingDiscount: 0));
        List<OrderItem> orders = [
          OrderItem(
            name: "Apple",
            quantity: 4,
            price: '10',
            currency: "USD",
          ),
          OrderItem(
            name: "Pineapple",
            quantity: 5,
            price: "12",
            currency: "USD",
          ),
        ];
        var itemList = ItemList(items: orders);
        return CustomButton(
          onTap: () {
            // BlocProvider.of<PaymentCubit>(context).makePayment(
            //   paymentIntentInputModel: paymentIntentInputModel,
            // );
            // print(it);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => PaypalCheckoutView(
                sandboxMode: true,
                clientId: ApiKeys.clientId,
                secretKey: ApiKeys.clientPass,
                transactions: [
                  {
                    "amount": amount.toJson(),
                    "description": "The payment transaction description.",
                    // "payment_options": {
                    //   "allowed_payment_method":
                    //       "INSTANT_FUNDING_SOURCE"
                    // },
                    "item_list": {
                      "items": itemList.items
                    }
                  }
                ],
                note: "Contact us for any questions on your order.",
                onSuccess: (Map params) async {
                  log("onSuccess: $params");
                  Navigator.pop(context);
                },
                onError: (error) {
                  log("onError: $error");
                  Navigator.pop(context);
                },
                onCancel: () {
                  print('cancelled:');
                  Navigator.pop(context);
                },
              ),
            ));
            navigatePaypalMethod(
                context: context, itemList: itemList, amount: amount);
          },
          text: "continue",
          isLoading: state is PaymentLoadingState ? true : false,
        );
      },
    );
  }

// ({ItemListModel itemList, AmountModel amount}) getTransactionData() {
//   var amount = AmountModel(
//       total: '100',
//       currency: 'USD',
//       details: Details(subtotal: '100', shipping: '0', shippingDiscount: 0));
//   List<OrderItem> orders = [
//     OrderItem(
//       name: "Apple",
//       quantity: 4,
//       price: '10',
//       currency: "USD",
//     ),
//     OrderItem(
//       name: "Pineapple",
//       quantity: 5,
//       price: "12",
//       currency: "USD",
//     ),
//   ];
//   var itemList = ItemListModel(items: orders);
//   return (
//     amount: amount,
//     itemList = itemList,
//   );
// }
}

navigatePaypalMethod(
    {required BuildContext context,
    required AmountModel amount,
    required ItemList itemList}) {
  return Navigator.of(context).push(MaterialPageRoute(
    builder: (BuildContext context) => PaypalCheckoutView(
      sandboxMode: true,
      clientId: ApiKeys.clientId,
      secretKey: ApiKeys.clientPass,
      transactions: [
        {
          "amount": amount.toJson(),
          "description": "The payment transaction description.",
          // "payment_options": {
          //   "allowed_payment_method":
          //       "INSTANT_FUNDING_SOURCE"
          // },
          "item_list": {
            "items": itemList.toJson(),
          }
        }
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        log("onSuccess: $params");
        Navigator.pop(context);
      },
      onError: (error) {
        log("onError: $error");
        Navigator.pop(context);
      },
      onCancel: () {
        print('cancelled:');
        Navigator.pop(context);
      },
    ),
  ));
}
