import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/down_item_model.dart';

class NewsService {
  NewsService({required this.dio});
  final Dio dio;

  Future<List<ArticleModel>> getNews() async {
    var response = await dio.get(
      'https://newsapi.org/v2/top-headlines?category=sports&apiKey=0551b9dab07742f69da0fbece494b00b',
    );

    Map<String, dynamic> JsonData = response.data;
    List<dynamic> articles = JsonData['articles'];

    List<ArticleModel> list = [];

    for (var article in articles) {
      if (article['urlToImage'] != null && article['description'] != null) {
        ArticleModel articleModel = ArticleModel(
          title: article['title'],
          description: article['description'],
          urlToImage: article['urlToImage'],
        );
        list.add(articleModel);
      }
    }

    return list;
  }
}
