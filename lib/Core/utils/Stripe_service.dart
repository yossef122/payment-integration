import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/Core/utils/api_keys.dart';
import 'package:payment/Core/utils/api_service.dart';
import 'package:payment/Features/Checkout/data/models/ephemeral%20_model.dart';
import 'package:payment/Features/Checkout/data/models/init_payment_sheet_model.dart';
import 'package:payment/Features/Checkout/data/models/paymentIntentModel.dart';
import 'package:payment/Features/Checkout/data/models/payment_intent_input_model.dart';

class StripeServices {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var res = await apiService.Post(
      body: paymentIntentInputModel.toJson(),
      token: ApiKeys.secretKey,
      contentType: Headers.formUrlEncodedContentType,
      endPoint: '/payment_intents',
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(res.data);
    return paymentIntentModel;
  }

  Future<EphemeralModel> createEphemeralKey(
      {required String customerId}) async {
    var res = await apiService.Post(
        body: {
          "customer": customerId,
        },
        token: ApiKeys.secretKey,
        contentType: Headers.formUrlEncodedContentType,
        endPoint: '/ephemeral_keys',
        headers: {
          "Stripe-Version": "2023-08-16",
          "Authorization": "Bearer ${ApiKeys.secretKey}",
        });

    var ephemeralKey = EphemeralModel.fromJson(res.data);
    print(ephemeralKey);
    return ephemeralKey;
  }

  Future initPaymentSheet(
      {
      // required String paymentIntentClientSecret,
      // required String ephemeralKey,
      required InitPaymentSheetModel initPaymentSheetModel}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret:
          initPaymentSheetModel.paymentIntentClientSecret,
      merchantDisplayName: "joe",
      customerEphemeralKeySecret: initPaymentSheetModel.ephemeralKey,
      customerId: initPaymentSheetModel.customerId,
    ));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntent = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel =
        await createEphemeralKey(customerId: paymentIntent.customer!);
    var initPaymentSheetModel = InitPaymentSheetModel(
        paymentIntentClientSecret: paymentIntent.clientSecret!,
        customerId: paymentIntent.customer,
        ephemeralKey: ephemeralKeyModel.secret!);
    await initPaymentSheet(
      initPaymentSheetModel: initPaymentSheetModel,
      // paymentIntentClientSecret: paymentIntent.clientSecret,
    );
    await displayPaymentSheet();
  }
}
