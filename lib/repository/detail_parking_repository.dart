import 'package:bike_rental/entity/bike/bike.dart';
import 'package:bike_rental/service/service.dart';

class DetailParkingRepository implements DetailParkingService {
  final DetailParkingService detailParkingRemoteService =
      DetailParkingRemoteService();

  DetailParkingRepository();

  @override
  Future<List<Bike>?> getAllBikeByParkingId(String parkingId) async {
    return await detailParkingRemoteService.getAllBikeByParkingId(parkingId);
  }
}
