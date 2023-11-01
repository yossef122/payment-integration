import 'package:flutter/material.dart';
import 'package:payment/Features/Checkout/Presentation/Views/widgets/Payment_Method_Item.dart';

class PaymentMethodListView extends StatefulWidget {
  const PaymentMethodListView({Key? key}) : super(key: key);

  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {
  final List<String> paymentMethod = [
    "assets/images/cardvisa.png",
    "assets/images/PayPal.png"
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: SizedBox(
        height: 63,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  activeIndex = index;
                  setState(() {});
                },
                child: PaymentMethodItem(
                  image: paymentMethod[index],
                  isActive: activeIndex == index,
                ),
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: paymentMethod.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 20,
              );
            },
          ),
        ),
      ),
    );
  }
}