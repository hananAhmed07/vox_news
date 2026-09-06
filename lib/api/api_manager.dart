import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_constants.dart';
import 'end_points.dart';

import '../models/source_response.dart';

import '../models/news_response.dart';

class ApiManager {
  static Future<SourceResponse?> getSources(
      String categoryID,
      String language,
      ) async {
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      EndPoints.sourceApi,
      {
        'apiKey': ApiConstants.apiKey,
        'category': categoryID,
        'language': language,
      },
    );
    try {
      var response = await http.get(url);

      var responseBody = response.body;

      var json = jsonDecode(responseBody);

      return SourceResponse.fromJson(json);
    } catch (e) {
      throw Exception(e);
    }
  }
  static Future<NewsResponse?> getNewsBySourceId({
    required String sourceId,
    required String language,
    int page = 1,
    int pageSize = 20,
    String? query,
  }) async {
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      EndPoints.newsApi,
      {
        'apiKey': ApiConstants.apiKey,
        'sources': sourceId,
        'language': language,
        'page': page.toString(),
        'pageSize': pageSize.toString(),
        if (query != null && query.isNotEmpty) 'q': query,
      },
    );

    try {
      var response = await http.get(url);

      var responseBody = response.body;

      return NewsResponse.fromJson(jsonDecode(responseBody));
    } catch (e) {
      throw Exception(e);
    }
  }
}