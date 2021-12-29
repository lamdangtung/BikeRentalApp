// To parse this JSON data, do
//
//     final paymentTransaction = paymentTransactionFromJson(jsonString);

import 'dart:convert';

PaymentTransaction paymentTransactionFromJson(String str) =>
    PaymentTransaction.fromJson(json.decode(str));

String paymentTransactionToJson(PaymentTransaction data) =>
    json.encode(data.toJson());

class PaymentTransaction {
  PaymentTransaction({
    required this.cardCode,
    required this.owner,
    required this.cvvCode,
    required this.dateExpired,
    required this.command,
    required this.transactionContent,
    required this.amount,
    required this.createdAt,
    required this.transactionId,
  });

  String cardCode;
  String owner;
  String cvvCode;
  String dateExpired;
  String command;
  String transactionContent;
  String amount;
  DateTime createdAt;
  String transactionId;

  factory PaymentTransaction.fromJson(Map<String, dynamic> json) =>
      PaymentTransaction(
        cardCode: json["cardCode"],
        owner: json["owner"],
        cvvCode: json["cvvCode"],
        dateExpired: json["dateExpired"],
        command: json["command"],
        transactionContent: json["transactionContent"],
        amount: json["amount"],
        createdAt: DateTime.parse(json["createdAt"]),
        transactionId: json["transactionId"],
      );

  Map<String, dynamic> toJson() => {
        "cardCode": cardCode,
        "owner": owner,
        "cvvCode": cvvCode,
        "dateExpired": dateExpired,
        "command": command,
        "transactionContent": transactionContent,
        "amount": amount,
        "createdAt": createdAt.toIso8601String(),
        "transactionId": transactionId,
      };
}
