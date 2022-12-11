class DailyModel {
  //dynamic id;
  String title;
  String content;

  DailyModel({
    required this.title,
    required this.content,
  });

  factory DailyModel.fromJson(Map<String, dynamic> Json) {
    return DailyModel(
      title: Json['title'],
      content: Json['content'],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        //'id': id,
        'title' : title,
        'content': content,
      };
}