import 'package:bike_rental/data/models/parking.dart';
import 'package:bike_rental/data/service/home_service.dart';

class HomeRepository implements HomeService {
  final HomeService homeService;

  HomeRepository({required this.homeService});

  @override
  Future<List<Parking>?> getAllParking() async {
    final res = await homeService.getAllParking();
    return res;
  }
}
