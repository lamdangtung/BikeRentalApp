import 'package:bike_rental/entity/payment/credit_card.dart';
import 'package:bike_rental/entity/payment/payment_transaction.dart';

abstract class PaymentService {
  Future<PaymentTransaction?> payOrder(
    CreditCard creditCard,
    String command,
    int amount,
    String createdAt,
  );
}
