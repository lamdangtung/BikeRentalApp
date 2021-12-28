// To parse this JSON data, do
//
//     final bike = bikeFromJson(jsonString);

import 'dart:convert';

Bike bikeFromJson(String str) => Bike.fromJson(json.decode(str));

String bikeToJson(Bike data) => json.encode(data.toJson());

class Bike {
  Bike({
    required this.id,
    required this.category,
    required this.barcode,
    required this.isRented,
    required this.deposite,
    required this.licenseplate,
    required this.parkingId,
    required this.rentalPrice,
  });

  String id;
  String category;
  String barcode;
  String isRented;
  String deposite;
  String licenseplate;
  String parkingId;
  String rentalPrice;

  factory Bike.fromJson(Map<String, dynamic> json) => Bike(
        id: json["id"],
        category: json["category"],
        barcode: json["barcode"],
        isRented: json["isRented"],
        deposite: json["deposite"],
        licenseplate: json["licenseplate"],
        parkingId: json["parkingId"],
        rentalPrice: json["rentalPrice"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "barcode": barcode,
        "isRented": isRented,
        "deposite": deposite,
        "licenseplate": licenseplate,
        "parkingId": parkingId,
        "rentalPrice": rentalPrice,
      };
}
