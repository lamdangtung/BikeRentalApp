import 'dart:convert';
import 'dart:io';

import 'package:bike_rental/entity/parking.dart';
import 'package:bike_rental/utils/api.dart';
import 'package:http/http.dart' as http;

import 'home_service.dart';

class HomeRemoteService implements HomeService {
  @override
  Future<List<Parking>?> getAllParking() async {
    try {
      final String url = API.baseUrl + API.parkingRoute + "all_parking.php";
      final res = await http.get(
        Uri.parse(url),
      );
      if (res.statusCode == HttpStatus.ok) {
        Iterable data = jsonDecode(res.body)["data"];
        final listParking =
            List<Parking>.from(data.map((e) => Parking.fromJson(e)));
        return listParking;
      }
    } catch (e) {
      print("getAllParking -> error: ${e.toString()}");
    }
    return null;
  }
}
