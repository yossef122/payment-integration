import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/Core/Widgets/Custom_appBar.dart';
import 'package:payment/Features/Checkout/Presentation/Views/widgets/Card_View_Body.dart';

class MyCardView extends StatelessWidget {
  const MyCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'My Cart'),
      body: const CardViewBody(),
    );
  }
}

// paymentIntentObject createPaymentIntent (amount,currency,,customer id){}
// key secret  create ephemeral key(stripe version,customer Id)
// initPaymentSheet(merchant display name, paymentIntentClientSecret ,ephemeral key secret){}
// present payment sheet
// https://api.stripe.com/v1/ephemeral_keys
// Future<void> initPaymentSheet() async {
//   try {
//     // 1. create payment intent on the server
//     // final data = await _createTestPaymentSheet();
//
//     // 2. initialize the payment sheet
//     await Stripe.instance.initPaymentSheet(
//       paymentSheetParameters: SetupPaymentSheetParameters(
//
//         // Main params
//         merchantDisplayName: 'Flutter Stripe Store Demo',
//         paymentIntentClientSecret: data['paymentIntent'],
//         // Customer keys
//         // customerEphemeralKeySecret: data['ephemeralKey'],
//         // customerId: data['customer'],
//         // // Extra options
//         // testEnv: true,
//         // applePay: true,
//         // googlePay: true,
//         // style: ThemeMode.dark,
//         // merchantCountryCode: 'DE',
//       ),
//     );
//     setState(() {
//       _ready = true;
//     });
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Error: $e')),
//     );
//     rethrow;
//   }
// }
