class Parking {
  final int id;
  final String name;
  final String address;
  final double area;
  final int singleBike;
  final int coupleBike;
  final int electricBike;
  int? emptySingleBike;
  int? emptyCoupleBike;
  int? emptyElectricBike;

  Parking(
      {required this.id,
      required this.name,
      required this.address,
      required this.area,
      required this.singleBike,
      required this.coupleBike,
      required this.electricBike,
      this.emptySingleBike,
      this.emptyCoupleBike,
      this.emptyElectricBike});
}
