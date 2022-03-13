import 'package:hive/hive.dart';
part 'news_model.g.dart';

@HiveType(typeId: 0)
class NewsModel {
  NewsModel({
    this.status,
    this.totalResults,
    this.articles,
  });
  @HiveField(0)
  String? status;
  @HiveField(1)
  int? totalResults;
  @HiveField(2)
  List<Article>? articles;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  get length => null;
}

@HiveType(typeId: 1)
class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });
  @HiveField(0)
  Source? source;
  @HiveField(1)
  String? author;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? url;
  @HiveField(5)
  String? urlToImage;
  @HiveField(6)
  DateTime? publishedAt;
  @HiveField(7)
  String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] == null ? null : json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] == null ? null : json["content"],
      );
}

@HiveType(typeId: 2)
class Source {
  Source({
    this.id,
    this.name,
  });
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
      );
}
