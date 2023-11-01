import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment/Core/utils/styles.dart';
import 'package:payment/Features/Checkout/Presentation/Views/widgets/Total_Price_OfOrder.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(
          0xFFEDEDED,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, left: 22, right: 22),
        child: Column(
          children: [
            const Text(
              "Thank You",
              style: Styles.style25,
              textAlign: TextAlign.center,
            ),
            Text(
              "Your transaction was successful",
              style: Styles.style20,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 42,
            ),
            const SuccessPaymentInfo(
              title: "Date",
              value: "10/25/2023",
            ),
            const SizedBox(
              height: 20,
            ),
            const SuccessPaymentInfo(
              title: "Time",
              value: "10:22 AM",
            ),
            const SizedBox(
              height: 20,
            ),
            const SuccessPaymentInfo(
              title: "To",
              value: "Y JOE",
            ),
            const Divider(
              thickness: 2,
              height: 60,
            ),
            TotalPriceOfOrder(value: "5055", title: "Total"),
            const SizedBox(
              height: 30,
            ),
            const CardInfoOfSuccess(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(FontAwesomeIcons.barcode,size: 64,),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1.50,
                        color: Color(
                          0xFF34A853,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Paid",
                      style: Styles.style24.copyWith(
                        color: const Color(
                          0xFF34A853,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: (MediaQuery.sizeOf(context).height * .105)- 29,
            )
          ],
        ),
      ),
    );
  }
}

class SuccessPaymentInfo extends StatelessWidget {
  const SuccessPaymentInfo({Key? key, this.title, this.value})
      : super(key: key);
  final String? title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style: Styles.style18,
          textAlign: TextAlign.center,
        ),
        Text(
          value!,
          style: Styles.styleBold18,
          // textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class CardInfoOfSuccess extends StatelessWidget {
  const CardInfoOfSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      height: 73,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
      ),
      child: const Row(
        children: [
          Image(
            image: AssetImage(
              'assets/images/Mastercard_2.jpg',
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Credit Card",
                style: Styles.style18,
                textAlign: TextAlign.center,
              ),
              Text(
                "Master Card **78",
                style: Styles.style18,
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}
