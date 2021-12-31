import 'package:bike_rental/service/rent_bike_remote_service.dart';
import 'package:bike_rental/service/rent_bike_service.dart';

class RentBikeRepository implements RentBikeService {
  final RentBikeRemoteService rentBikeRemoteService = RentBikeRemoteService();
  @override
  Future<Map<String, dynamic>?> getRentBike(int invoiceId) async {
    return await rentBikeRemoteService.getRentBike(invoiceId);
  }
}
