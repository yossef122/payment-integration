import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Core/Widgets/Custom_button.dart';
import 'package:payment/Features/Checkout/Presentation/Manager/payment_cubit.dart';
import 'package:payment/Features/Checkout/Presentation/Views/widgets/Custom_Button_Bloc_Consumer.dart';

// import 'package:payment/Features/Checkout/Presentation/Views/payment_details.dart';
import 'package:payment/Features/Checkout/Presentation/Views/widgets/Order_Info_Item.dart';
import 'package:payment/Features/Checkout/Presentation/Views/widgets/Payment_Method_ListView.dart';
import 'package:payment/Features/Checkout/Presentation/Views/widgets/Total_Price_OfOrder.dart';
import 'package:payment/Features/Checkout/data/repository/checkout_repo_imple.dart';

class CardViewBody extends StatelessWidget {
  const CardViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          const Expanded(
            child: Image(
              image: AssetImage(
                "assets/images/Annotation 2023-10-22 212939.png",
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          OrderInfoItem(
            value: "25.00\$",
            title: "Order Sub total",
          ),
          const SizedBox(
            height: 2,
          ),
          OrderInfoItem(
            value: "0\$",
            title: "Discount",
          ),
          const SizedBox(
            height: 2,
          ),
          OrderInfoItem(
            value: "8.00\$",
            title: "Shipping",
          ),
          const Divider(
            thickness: 2,
            height: 34, //17 up and 17 down
            color: Color(0xffc7c7c7),
          ),
          TotalPriceOfOrder(
            value: "33.00\$",
            title: 'Total',
          ),
          const SizedBox(
            height: 15,
          ),
          CustomButton(
            text: "Complete payment",
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return const PaymentDetailsView();
              //     },
              //   ),
              // );
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  context: context,
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => PaymentCubit(CheckoutRepoImplementation()),
                      child: const PaymentMethodBottomSheet(),
                    );
                  });
            },
          ),
          const SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }
}

class PaymentMethodBottomSheet extends StatelessWidget {
  const PaymentMethodBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentMethodListView(),
          SizedBox(
            height: 16,
          ),
          CustomButtonBlocConsumer(),
        ],
      ),
    );
  }
}
