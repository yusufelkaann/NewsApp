class News {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  News(this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content);

  News.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      description = json['description'],
      url = json['url'],
      urlToImage = json['urlToImage'],
      publishedAt = json['publishedAt'],
      content = json['content'];
}
