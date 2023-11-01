import 'package:flutter/material.dart';
import 'package:payment/Core/Widgets/Custom_Check_Icon.dart';
import 'package:payment/Core/Widgets/Custom_Dashed_Line.dart';
import 'package:payment/Core/Widgets/Custom_appBar.dart';
import 'package:payment/Features/Checkout/Presentation/Views/payment_details.dart';
import 'package:payment/Features/Checkout/Presentation/Views/widgets/Thank_You_Card.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const PaymentDetailsView();
            },
          ),
        );
      }),
      body: Transform.translate(
        offset: const Offset(0, -16),
        child: const SuccessViewBody(),
      ),
    );
  }
}

class SuccessViewBody extends StatelessWidget {
  const SuccessViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            left: 16 + 10,
            right: 16 + 10,
            bottom: MediaQuery.sizeOf(context).height * .22,
            child: const CustomDashedLine(),
          ),
          Positioned(
            left: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            right: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: const CircleAvatar(
                // backgroundColor: Colors.white,
                ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            top: -50,
            child: CustomCheckIcon(),
          )
        ],
      ),
    );
  }
}
