import 'package:bike_rental/entity/payment/credit_card.dart';
import 'package:bike_rental/entity/payment/payment_transaction.dart';

abstract class InterbankInterface {
  Future<PaymentTransaction?> payOrder(
      {required CreditCard card,
      required int amount,
      required String contents});
}
