import 'package:bike_rental/subsystem/interbank/interbank_service.dart';

class InterbankBoundary {
  Future<String?> query(String url, String data) async {
    String? response = null;
    try {
      response = await InterbankService.post(url, data);
    } catch (e) {
      print(e.toString());
    }
    return response;
  }
}
