import 'package:jooheesong/daily.dart';

class DailyListModel {
  final List<DailyModel> list;

  DailyListModel({
    required this.list,
  });

  factory DailyListModel.fromJson(List<dynamic> parsedJson) {
    List<DailyModel> list = <DailyModel>[];
    list = parsedJson.map((e) => DailyModel.fromJson(e)).toList();
    return new DailyListModel(list: list);
  }

}