import 'package:jooheesong/daily.dart';

class DateList {
  //dynamic id;
  String date;
  List<dynamic> dailyList;

  DateList({
    required this.date,
    required this.dailyList,
  });

  factory DateList.fromJson(Map<String, dynamic> Json) {
    return DateList(
      date: Json['date'],
      dailyList: Json['dailyList'],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        //'id': id,
        'date' : date,
        'dailyList': dailyList,
      };
}