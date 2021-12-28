import 'package:bike_rental/entity/parking.dart';

abstract class HomeService {
  Future<List<Parking>?> getAllParking();
}
