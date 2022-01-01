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
      required String contents,
      required String command}) async {
    PaymentTransaction? paymentTransaction =
        await _interBankSubSystemController.payOrder(
            card: card, amount: amount, contents: contents, commmand: command);
    return paymentTransaction;
  }

  @override
  Future<PaymentTransaction?> refund(
      {required CreditCard card,
      required int amount,
      required String contents,
      required String command}) async {
    PaymentTransaction? paymentTransaction =
        await _interBankSubSystemController.refund(
            card: card, amount: amount, contents: contents, commmand: command);
    return paymentTransaction;
  }
}
