class News {
  String? name;
  String? title;
  String? description;
  String? image;
  String? content;

  News({
    required this.name,
    required this.title,
    required this.description,
    required this.content,
    required this.image,
  });

  factory News.fromMap({required Map data}) {
    return News(
      name: data["source"]["name"],
      title: data["title"],
      description: data["description"],
      content: data["content"],
      image: data["urlToImage"],
    );
  }
}
