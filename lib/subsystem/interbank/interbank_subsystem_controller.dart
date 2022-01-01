import 'dart:core';

import 'package:bike_rental/entity/payment/credit_card.dart';
import 'package:bike_rental/entity/payment/payment_transaction.dart';
import 'package:bike_rental/subsystem/interbank/interbank_service.dart';

class InterBankSubSystemController {
  final InterbankService interbankService = InterbankService();
  Future<PaymentTransaction?> payOrder(
      {required CreditCard card,
      required int amount,
      required String contents,
      required String commmand}) async {
    return interbankService.payOrder(
        card: card, amount: amount, contents: contents, command: commmand);
  }

  Future<PaymentTransaction?> refund(
      {required CreditCard card,
      required int amount,
      required String contents,
      required String commmand}) async {
    return interbankService.refund(
        card: card, amount: amount, contents: contents, command: commmand);
  }
}
