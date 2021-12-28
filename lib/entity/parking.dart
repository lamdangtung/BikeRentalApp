// To parse this JSON data, do
//
//     final parking = parkingFromJson(jsonString);

import 'dart:convert';

Parking parkingFromJson(String str) => Parking.fromJson(json.decode(str));

String parkingToJson(Parking data) => json.encode(data.toJson());

class Parking {
  Parking({
    required this.id,
    required this.name,
    required this.address,
    required this.area,
    required this.numSingle,
    required this.numCouple,
    required this.numElectric,
    required this.emptySingle,
    required this.emptyCouple,
    required this.emptyElectric,
  });

  String id;
  String name;
  String address;
  String area;
  String numSingle;
  String numCouple;
  String numElectric;
  String emptySingle;
  String emptyCouple;
  String emptyElectric;

  factory Parking.fromJson(Map<String, dynamic> json) => Parking(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        area: json["area"],
        numSingle: json["num_single"],
        numCouple: json["num_couple"],
        numElectric: json["num_electric"],
        emptySingle: json["empty_single"],
        emptyCouple: json["empty_couple"],
        emptyElectric: json["empty_electric"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "area": area,
        "num_single": numSingle,
        "num_couple": numCouple,
        "num_electric": numElectric,
        "empty_single": emptySingle,
        "empty_couple": emptyCouple,
        "empty_electric": emptyElectric,
      };
}
