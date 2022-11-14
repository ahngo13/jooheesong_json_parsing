class Daily {
  //dynamic id;
  String title;
  String content;

  Daily({
    required this.title,
    required this.content,
  });

  factory Daily.fromJson(Map<String, dynamic> Json) {
    return Daily(
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