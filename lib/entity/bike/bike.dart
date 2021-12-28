class Bike {
  int id;
  String category;
  String barcode;
  bool? isRented;
  int? deposite;
  int? retalPrice;
  String? licensePlate;
  int? parkingId;

  Bike({
    required this.id,
    required this.category,
    required this.barcode,
    this.isRented = false,
    this.deposite,
    this.retalPrice,
    this.licensePlate,
    this.parkingId,
  });
}
