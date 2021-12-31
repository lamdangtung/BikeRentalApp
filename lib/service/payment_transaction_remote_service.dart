import 'dart:convert';
import 'dart:io';

import 'package:bike_rental/entity/invoice/rental_invoice.dart';
import 'package:bike_rental/entity/payment/payment_transaction.dart';
import 'package:bike_rental/service/payment_transaction_service.dart';
import 'package:bike_rental/utils/api.dart';
import 'package:http/http.dart' as http;

class PaymentTransactionRemoteService implements PaymentTransactionService {
  @override
  Future<bool> createPaymentTransaction(
      {required PaymentTransaction paymentTransaction,
      required RentalInvoice rentalInvoice}) async {
    try {
      Map<String, dynamic> data = {};
      data["id"] = paymentTransaction.transactionId;
      data["content"] = paymentTransaction.transactionContent;
      data["createdAt"] = paymentTransaction.createdAt;
      data["method"] = paymentTransaction.command;
      data["invoiceId"] = rentalInvoice.id;
      data["bikeId"] = rentalInvoice.bikeId;
      final res = await http.post(
          Uri.parse(API.baseUrl +
              API.paymentTransactionRoute +
              "create_payment_transaction.php"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(data));
      if (res.statusCode == HttpStatus.ok) {
        final body = jsonDecode(res.body);
        if (body["message"] == "Payment Transaction Created") {
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      print("createPaymentTransaction -> error: ${e.toString()}");
    }
    return false;
  }
}
