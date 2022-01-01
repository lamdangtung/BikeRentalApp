class RentalInvoice {
  int? id;
  int totalPrice;
  int bikeId;
  String createdAt;
  int? parkingId;
  RentalInvoice(
      {this.id,
      required this.totalPrice,
      required this.bikeId,
      required this.createdAt});

  Map<String, dynamic> toJson() => {
        "totalPrice": totalPrice,
        "bikeId": bikeId,
        "createdAt": createdAt,
        "parkingId": parkingId,
      };

  factory RentalInvoice.fromJson(Map<String, dynamic> json) => RentalInvoice(
        id: int.parse(json["id"]),
        totalPrice: int.parse(json["totalPrice"]),
        bikeId: int.parse(json["bikeId"]),
        createdAt: json["createdAt"].toString(),
      );

  @override
  String toString() {
    return 'RentalInvoice{id: $id, totalPrice: $totalPrice, bikeId: $bikeId, createdAt: $createdAt}';
  }
}
