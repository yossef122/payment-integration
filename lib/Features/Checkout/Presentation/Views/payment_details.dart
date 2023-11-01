import 'package:flutter/material.dart';
import 'package:payment/Core/Widgets/Custom_appBar.dart';
import 'package:payment/Features/Checkout/Presentation/Views/checkOutMain.dart';
import 'package:payment/Features/Checkout/Presentation/Views/widgets/payment_Details_ViewBody.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'Payment Details',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const MyCardView();
              },
            ),
          );
        },
      ),
      body: const PaymentDetailsViewBody(),
    );
  }
}
//

//
