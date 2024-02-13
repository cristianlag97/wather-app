import 'package:intl/intl.dart';

String formatterDate(DateTime dateTime) {
  final formato = DateFormat('dd/MM/yyyy');
  return formato.format(dateTime);
}
