import 'package:dartz/dartz.dart';
import 'package:payment/Core/errors/failure.dart';
import 'package:payment/Core/utils/Stripe_service.dart';
import 'package:payment/Features/Checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/Features/Checkout/data/repository/checkout_repo.dart';

class CheckoutRepoImplementation extends CheckoutRepo {
  final StripeServices stripeServices = StripeServices();

  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeServices.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return right(
        null,
      );
    } catch (e) {
      return left(
        ServerFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
