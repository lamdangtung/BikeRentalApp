import 'dart:convert';
import 'dart:io';

import 'package:bike_rental/entity/invoice/rental_invoice.dart';
import 'package:bike_rental/service/rental_invoice/rental_invoice_service.dart';
import 'package:bike_rental/utils/api.dart';
import 'package:http/http.dart' as http;

class RentalInvoiceRemoteService implements RentalInvoiceSerVice {
  @override
  Future<RentalInvoice?> createRentalInvoice(
      {required RentalInvoice rentalInvoice}) async {
    try {
      final res = await http.post(
          Uri.parse(API.baseUrl +
              API.rentalInvoiceRoute +
              "create_retal_invoice.php"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(rentalInvoice.toJson()));
      if (res.statusCode == HttpStatus.ok) {
        final body = jsonDecode(res.body);
        if (body["message"] == "Rental Invoice Created") {
          RentalInvoice temp = RentalInvoice.fromJson(body["rental_invoice"]);
          return temp;
        }
      }
    } catch (e) {
      print("createRentalInvoice -> error: ${e.toString()}");
    }
    return null;
  }
}
