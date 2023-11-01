import 'package:flutter/material.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({Key? key, this.isActive = false, this.image = ""})
      : super(key: key);
  final bool isActive;
  final String image;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: Container(
        width: 103,
        height: 62,
        decoration: ShapeDecoration(
          color: const Color(
            0xFF34A853,
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.50,
              color: isActive
                  ? const Color(
                0xff34A852,
              )
                  : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(
              15,
            ),
          ),
          shadows: [
            BoxShadow(
              color: isActive
                  ? const Color(
                0xff34A852,
              )
                  : Colors.white,
              blurRadius: 4,
              offset: const Offset(0, 0),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              15,
            ),
            color: Colors.white,
          ),
          child: Center(
            child: Image(
              fit: BoxFit.scaleDown,
              height: 35,
              width: 75,
              image: AssetImage(
                image,
              ),
              // height: 30,
            ),
          ),
        ),
      ),
    );
  }
}
