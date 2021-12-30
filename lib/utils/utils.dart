import 'package:intl/intl.dart';

class Utils {
  static String getTimeNow() {
    return DateFormat("yyyy-MM-dd H:m:s").format(DateTime.now()).toString();
  }
}
