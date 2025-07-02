import 'package:dio/dio.dart';
import 'package:news_app/models/news_article_model.dart';

class NewsApiService {
  NewsApiService({required this.dio});
  final Dio dio;

  Future<List<NewsArticleModel>> getNews({required String category}) async {
    try {
      var response = await dio.get(
        'https://newsapi.org/v2/top-headlines?category=${category}&apiKey=0551b9dab07742f69da0fbece494b00b',
      );

      Map<String, dynamic> JsonData = response.data;
      List<dynamic> articles = JsonData['articles'];

      List<NewsArticleModel> list = [];

      for (var article in articles) {
        if (article['urlToImage'] != null && article['description'] != null) {
          NewsArticleModel articleModel = NewsArticleModel(
            title: article['title'],
            description: article['description'],
            urlToImage: article['urlToImage'],
          );
          list.add(articleModel);
        }
      }

      return list;
    } catch (e) {
      // throw Exception("Error in getNews: $e");
      return [];
    }
  }
}
