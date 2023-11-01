import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment/Features/Checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/Features/Checkout/data/repository/checkout_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoadingState());
    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    //     .then((value) {
    //   emit(PaymentSuccessState());
    // }).catchError((e) {
    //   emit(PaymentErrorState(errMessage: e.toString()));
    // });
    data.fold(
      (l) => emit(
        PaymentErrorState(
          errMessage: l.errMessage,
        ),
      ),
      (r) => emit(
        PaymentSuccessState(),
      ),
    );
    // return data;
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
