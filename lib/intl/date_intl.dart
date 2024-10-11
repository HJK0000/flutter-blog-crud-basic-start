import 'package:intl/intl.dart';

void main(){
  String createdAt = "2024-10-11 09:17:31";
  DateTime parsedDate = DateTime.parse(createdAt.replaceAll(' ', 'T'));
  print(parsedDate); // 2024-10-11 09:17:31.000

  String createdAt2 = "2024-10-11 09:17:31";
  DateTime dt = DateTime.parse(createdAt2);
  dt = dt.add(Duration(days: 1));
  String formatDt = DateFormat("yyyy.MM.dd").format(dt);
  print(formatDt);


/*

  DateTime dt = DateTime.now();
  print(dt);
  print(dt.day);
  print(dt.hour);
*/

}