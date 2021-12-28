import 'package:bike_rental/data/models/parking.dart';

abstract class HomeService {
  Future<List<Parking>?> getAllParking();
}
