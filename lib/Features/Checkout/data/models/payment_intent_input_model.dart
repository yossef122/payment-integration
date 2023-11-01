class PaymentIntentInputModel {
  String? amount;
  final String? currency;
  final String? customerId;

  PaymentIntentInputModel({
    this.amount,
    this.currency,
    required this.customerId,
  });

  Map<String, dynamic> toJson() {
    // amount = double.parse(amount!) as String;
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = (int.parse(amount!) * 100).toString();
    data['currency'] = currency;
    data['customer'] = customerId;
    return data;
  }
}
