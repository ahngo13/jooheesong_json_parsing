import 'package:jooheesong/daily.dart';

class DateModel {
  //dynamic id;
  String date;
  List<dynamic> dailyList;

  DateModel({
    required this.date,
    required this.dailyList,
  });

  factory DateModel.fromJson(Map<String, dynamic> Json) {
    return DateModel(
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