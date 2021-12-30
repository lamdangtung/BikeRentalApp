import 'package:bike_rental/entity/payment/credit_card.dart';
import 'package:bike_rental/entity/payment/payment_transaction.dart';
import 'package:bike_rental/subsystem/interbank_interface.dart';
import 'package:bike_rental/subsystem/interbank_subsystem.dart';

class PaymentRepository implements InterbankInterface {
  final InterbankSubsystem interbankSubsystem = InterbankSubsystem();

  PaymentRepository();

  @override
  Future<PaymentTransaction?> payOrder(
      {required CreditCard card,
      required int amount,
      required String contents}) async {
    return await interbankSubsystem.payOrder(
      amount: amount,
      card: card,
      contents: contents,
    );
  }
}
