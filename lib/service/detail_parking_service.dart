import 'package:bike_rental/entity/bike/bike.dart';

abstract class DetailParkingService {
  Future<List<Bike>?> getAllBikeByParkingId(String parkingId);
}
