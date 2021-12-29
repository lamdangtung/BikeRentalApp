import 'dart:convert';
import 'dart:io';

import 'package:bike_rental/entity/payment/credit_card.dart';
import 'package:bike_rental/entity/payment/payment_transaction.dart';
import 'package:bike_rental/service/payment_service.dart';
import 'package:bike_rental/utils/api.dart';
import 'package:http/http.dart' as http;

class PaymentRemoteService implements PaymentService {
  @override
  Future<PaymentTransaction?> payOrder(CreditCard creditCard, String command,
      int amount, String createdAt) async {
    Map<String, dynamic> data = Map();
    Map<String, dynamic> temp = Map();
    data["version"] = "1.0.1";
    temp.addAll(creditCard.toJson());
    print(jsonEncode(creditCard.toJson()));
    temp["amount"] = amount.toString();
    temp["createdAt"] = createdAt;
    temp["command"] = "pay";
    temp["transactionContent"] = "rent bike";
    data["transaction"] = temp.toString();
    data["appCode"] = "DJJIeH7fxjg=";
    data["hashCode"] = "7fe143fa76153e57276b653b53821e3a";
    try {
      print(jsonEncode(data));
      final res = await http.patch(
        Uri.parse(API.URL_PAY),
        body: jsonEncode(data),
      );
      if (res.statusCode == HttpStatus.ok) {
        final body = jsonDecode(res.body);
        if (body["errorCode"] == "00") {
          return PaymentTransaction.fromJson(body["transaction"]);
        }
      }
    } catch (e) {
      print("payOrder -> error: ${e.toString()}");
    }
  }
}
