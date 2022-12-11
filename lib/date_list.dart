import 'package:jooheesong/daily.dart';
import 'package:jooheesong/date.dart';

class DateListModel {
  final List<DateModel> list;

  DateListModel({
    required this.list,
  });

  factory DateListModel.fromJson(List<dynamic> parsedJson) {
    List<DateModel> list = <DateModel>[];
    list = parsedJson.map((e) => DateModel.fromJson(e)).toList();
    return new DateListModel(list: list);
  }

}