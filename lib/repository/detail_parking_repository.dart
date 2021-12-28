import 'package:bike_rental/entity/bike/bike.dart';
import 'package:bike_rental/service/detail_parking_service.dart';

class DetailParkingRepository implements DetailParkingService {
  final DetailParkingService detailParkingRemoteService;

  DetailParkingRepository({required this.detailParkingRemoteService});

  @override
  Future<List<Bike>?> getAllBikeByParkingId(String parkingId) async {
    try {
      final res =
          await detailParkingRemoteService.getAllBikeByParkingId(parkingId);
      return res;
    } catch (e) {
      print("getAllBikeByParkingId -> error: ${e.toString()}");
    }
    return null;
  }
}
