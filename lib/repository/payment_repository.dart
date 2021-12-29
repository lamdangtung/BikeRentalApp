import 'package:bike_rental/entity/payment/credit_card.dart';
import 'package:bike_rental/entity/payment/payment_transaction.dart';
import 'package:bike_rental/service/payment_service.dart';

class PaymentRepository implements PaymentService {
  final PaymentService paymentRemoteService;

  PaymentRepository(this.paymentRemoteService);

  @override
  Future<PaymentTransaction?> payOrder(
      CreditCard creditCard, String command, int amount, String createdAt) {
    return paymentRemoteService.payOrder(
        creditCard, command, amount, createdAt);
  }
}
