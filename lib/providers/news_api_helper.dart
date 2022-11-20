import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/modals/news.dart';

class NewsAPIHelper {
  NewsAPIHelper._();

  static final NewsAPIHelper newsAPIHelper = NewsAPIHelper._();

  Future<List<News>> fetchNewsData({required String category}) async {
    Dio dio = Dio();

    Response response = await dio.get("https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=a324fad8825841ce823dd125b20942a8");

    List<dynamic> res = response.data['articles'];

    List<News> data = res.map((e) => News.fromMap(data: e)).toList();

    return data;

  }

}