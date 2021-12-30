import 'package:bike_rental/entity/payment/credit_card.dart';
import 'package:bike_rental/entity/payment/payment_transaction.dart';
import 'package:bike_rental/subsystem/interbank/interbank_subsystem_controller.dart';
import 'package:bike_rental/subsystem/interbank_interface.dart';

class InterbankSubsystem implements InterbankInterface {
  final InterBankSubSystemController _interBankSubSystemController =
      InterBankSubSystemController();

  @override
  Future<PaymentTransaction?> payOrder(
      {required CreditCard card,
      required int amount,
      required String contents}) async {
    PaymentTransaction? paymentTransaction = await _interBankSubSystemController
        .payOrder(card: card, amount: amount, contents: contents);
    return paymentTransaction;
  }
}
