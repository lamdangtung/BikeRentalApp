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
    required this.numFreeSingle,
    required this.numFreeCouple,
    required this.numFreeElectric,
  });

  String id;
  String name;
  String address;
  String area;
  String numSingle;
  String numCouple;
  String numElectric;
  int numFreeSingle;
  int numFreeCouple;
  int numFreeElectric;
  static List<Parking> listParking = [];

  factory Parking.fromJson(Map<String, dynamic> json) => Parking(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        area: json["area"],
        numSingle: json["num_single"],
        numCouple: json["num_couple"],
        numElectric: json["num_electric"],
        numFreeSingle: json["num_free_single"],
        numFreeCouple: json["num_free_couple"],
        numFreeElectric: json["num_free_electric"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "area": area,
        "num_single": numSingle,
        "num_couple": numCouple,
        "num_electric": numElectric,
        "num_free_single": numFreeSingle,
        "num_free_couple": numFreeCouple,
        "num_free_electric": numFreeElectric,
      };

  static String getParkingName(String parkingId) {
    String parkingName = "";
    for (var element in listParking) {
      if (element.id == parkingId) {
        parkingName = element.name;
      }
    }
    return parkingName;
  }
}
