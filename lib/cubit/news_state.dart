import '../models/news_response.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsSuccess extends NewsState {
  final NewsResponse newsResponse;

  NewsSuccess(this.newsResponse);
}

class NewsError extends NewsState {
  final String message;

  NewsError(this.message);
}