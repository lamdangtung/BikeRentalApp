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
    required this.battery,
  });

  String id;
  String category;
  String barcode;
  String isRented;
  String deposite;
  String licenseplate;
  String parkingId;
  String rentalPrice;
  String? battery;
  factory Bike.fromJson(Map<String, dynamic> json) => Bike(
        id: json["id"],
        category: json["category"],
        barcode: json["barcode"],
        isRented: json["isRented"],
        deposite: json["deposite"],
        licenseplate: json["licenseplate"],
        parkingId: json["parkingId"],
        rentalPrice: json["rentalPrice"],
        battery: json["battery"] ?? "Không",
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
        "battery": battery,
      };

  static String getBikeType(String category) {
    switch (category) {
      case "XE_DAP_DON":
        return "Xe đạp đơn";
      case "XE_DAP_DOI":
        return "Xe đạp đôi";
      case "XE_DAP_DIEN":
        return "Xe đạp điện";
      default:
        return "";
    }
  }

  int caculateRentalAmount(int time) {
    if (time <= 10) {
      return 0;
    } else if (time > 10 && time <= 30) {
      return 15;
    } else {
      int rentPrice = int.parse(rentalPrice);
      double temp = 0;
      temp = 15 + rentPrice * (time - 30) / 15;
      return temp.toInt();
    }
  }
}
