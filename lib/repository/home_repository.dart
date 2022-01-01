import 'package:bike_rental/entity/parking/parking.dart';
import 'package:bike_rental/service/service.dart';

class HomeRepository implements HomeService, RentBikeService {
  final HomeService homeRemoteService = HomeRemoteService();
  final RentBikeService rentBikeRemoteService = RentBikeRemoteService();
  HomeRepository();

  @override
  Future<List<Parking>?> getAllParking() async {
    final res = await homeRemoteService.getAllParking();
    return res;
  }

  @override
  Future<Map<String, dynamic>?> getRentBike(int invoiceId) async {
    return await rentBikeRemoteService.getRentBike(invoiceId);
  }
}
