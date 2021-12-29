import 'dart:convert';

import 'package:http/http.dart' as http;

class InterbankService {
  static Future<dynamic> post(String url, String data) async {
    try {
      final res = await http.patch(
        Uri.parse(url),
        body: jsonDecode(data),
      );
      return res;
    } catch (e) {
      print("post -> error: ${e.toString()}");
    }
  }
}
