import 'dart:convert';
import 'dart:io';

import 'package:bike_rental/entity/payment/credit_card.dart';
import 'package:bike_rental/entity/payment/payment_transaction.dart';
import 'package:bike_rental/utils/api.dart';
import 'package:bike_rental/utils/utils.dart';
import 'package:http/http.dart' as http;

import '../interbank_interface.dart';

class InterbankService implements InterbankInterface {
  // static Future<dynamic> post(String url, String data) async {
  //   try {
  //     final res = await http.patch(
  //       Uri.parse(url),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonDecode(data),
  //     );
  //     return res;
  //   } catch (e) {
  //     print("post -> error: ${e.toString()}");
  //   }
  // }

  @override
  Future<PaymentTransaction?> payOrder({
    required CreditCard card,
    required int amount,
    required String contents,
    required String command,
  }) async {
    Map<String, dynamic> data = Map();
    data["version"] = API.version;
    data["appCode"] = API.appCode;
    data["hashCode"] = API.hashAppCode;
    Map<String, dynamic> transaction = Map();
    transaction["cardCode"] = card.cardCode;
    transaction["owner"] = card.owner;
    transaction["cvvCode"] = card.cvvCode;
    transaction["dateExpired"] = card.dateExpired;
    transaction["command"] = command;
    transaction["transactionContent"] = contents;
    transaction["amount"] = amount.toString();
    transaction["createdAt"] = Utils.getTimeNow();
    data["transaction"] = transaction;

    final res = await http.patch(
      Uri.parse(API.urlProcessTransaction),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );
    if (res.statusCode == HttpStatus.ok) {
      final body = jsonDecode(res.body);
      if (body["errorCode"] == "00") {
        return PaymentTransaction.fromJson(body["transaction"]);
      }
    }
    return null;
  }

  @override
  Future<PaymentTransaction?> refund(
      {required CreditCard card,
      required int amount,
      required String contents,
      required String command}) async {
    Map<String, dynamic> data = Map();
    data["version"] = API.version;
    data["appCode"] = API.appCode;
    data["hashCode"] = API.hashAppCode;
    Map<String, dynamic> transaction = Map();
    transaction["cardCode"] = card.cardCode;
    transaction["owner"] = card.owner;
    transaction["cvvCode"] = card.cvvCode;
    transaction["dateExpired"] = card.dateExpired;
    transaction["command"] = command;
    transaction["transactionContent"] = contents;
    transaction["amount"] = amount.toString();
    transaction["createdAt"] = Utils.getTimeNow();
    data["transaction"] = transaction;

    final res = await http.patch(
      Uri.parse(API.urlProcessTransaction),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );
    if (res.statusCode == HttpStatus.ok) {
      final body = jsonDecode(res.body);
      if (body["errorCode"] == "00") {
        return PaymentTransaction.fromJson(body["transaction"]);
      }
    }
    return null;
  }
}
