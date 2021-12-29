// To parse this JSON data, do
//
//     final creditCard = creditCardFromJson(jsonString);

import 'dart:convert';

CreditCard creditCardFromJson(String str) =>
    CreditCard.fromJson(json.decode(str));

String creditCardToJson(CreditCard data) => json.encode(data.toJson());

class CreditCard {
  CreditCard({
    required this.cardCode,
    required this.owner,
    required this.cvvCode,
    required this.dateExpired,
  });

  String cardCode;
  String owner;
  String cvvCode;
  String dateExpired;

  factory CreditCard.fromJson(Map<String, dynamic> json) => CreditCard(
        cardCode: json["cardCode"],
        owner: json["owner"],
        cvvCode: json["cvvCode"],
        dateExpired: json["dateExpired"],
      );

  Map<String, dynamic> toJson() => {
        "cardCode": cardCode,
        "owner": owner,
        "cvvCode": cvvCode,
        "dateExpired": dateExpired,
      };
}
