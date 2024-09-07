import 'package:intl/intl.dart';

class DateTimeFormatter {
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('yMMMd').add_jm().format(dateTime);
  }
}
