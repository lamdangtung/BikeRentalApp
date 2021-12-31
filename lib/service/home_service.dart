import 'package:bike_rental/entity/parking/parking.dart';

abstract class HomeService {
  Future<List<Parking>?> getAllParking();
}
