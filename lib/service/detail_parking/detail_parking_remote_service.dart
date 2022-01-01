import 'dart:convert';
import 'dart:io';

import 'package:bike_rental/entity/bike/bike.dart';
import 'package:bike_rental/utils/api.dart';
import 'package:http/http.dart' as http;

import 'detail_parking_service.dart';

class DetailParkingRemoteService implements DetailParkingService {
  @override
  Future<List<Bike>?> getAllBikeByParkingId(String parkingId) async {
    final String url = API.baseUrl +
        API.bikeRoute +
        "all_bike_by_parking_id.php?parkingId=$parkingId";
    final res = await http.get(
      Uri.parse(url),
    );
    if (res.statusCode == HttpStatus.ok) {
      Iterable data = jsonDecode(res.body)["data"];

      final listBike = List<Bike>.from(data.map((e) => Bike.fromJson(e)));
      return listBike;
    }
    return null;
  }
}
