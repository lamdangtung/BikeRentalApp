import 'package:bike_rental/subsystem/interbank/interbank_subsystem_controller.dart';
import 'package:bike_rental/subsystem/interbank_interface.dart';

class InterbankSubsystem implements InterbankInterface {
  final InterBankSubSystemController _interBankSubSystemController =
      InterBankSubSystemController();

  // @override
  // PaymentTransaction payOrder(CreditCard card, int amount, String contents) {
  // PaymentTransaction paymentTransaction =
  //     _interBankSubSystemController.payOrder(card, amount, contents);
  // return paymentTransaction;
  // }
}
