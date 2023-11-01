import 'package:dartz/dartz.dart';
import 'package:payment/Core/errors/failure.dart';
import 'package:payment/Features/Checkout/data/models/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
}
