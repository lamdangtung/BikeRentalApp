import 'dart:convert';
import 'dart:io';

import 'package:bike_rental/entity/bike/bike.dart';
import 'package:bike_rental/entity/invoice/rental_invoice.dart';
import 'package:bike_rental/service/rent_bike/rent_bike_service.dart';
import 'package:bike_rental/utils/api.dart';
import 'package:http/http.dart' as http;

class RentBikeRemoteService implements RentBikeService {
  @override
  Future<Map<String, dynamic>?> getRentBike(int invoiceId) async {
    final String url =
        API.baseUrl + API.bikeRoute + "rent_bike.php?invoiceId=$invoiceId";
    final res = await http.get(
      Uri.parse(url),
    );
    if (res.statusCode == HttpStatus.ok) {
      final body = jsonDecode(res.body);
      Map<String, dynamic> result = {};
      result["rent_bike"] = Bike.fromJson(body["rent_bike"]);
      final rentalInvoiceJson = body["rental_invoice"];
      result["rental_invoice"] = RentalInvoice(
        totalPrice: int.parse(rentalInvoiceJson["totalPrice"]),
        bikeId: int.parse(
          rentalInvoiceJson["bikeId"],
        ),
        createdAt: rentalInvoiceJson["createdAt"].toString(),
        id: int.parse(
          rentalInvoiceJson["invoiceId"],
        ),
      );

      return result;
    }
    return null;
  }
}
