import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/api_manager.dart';
import '../models/news_response.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  Future<void> getNewsBySourceId({
    required String sourceId,
    required String language,
    int page = 1,
    int pageSize = 20,
    String? query,
  }) async {
    emit(NewsLoading());

    try {
      NewsResponse? response = await ApiManager.getNewsBySourceId(
        sourceId: sourceId,
        language: language,
        page: page,
        pageSize: pageSize,
        query: query,
      );

      if (response != null) {
        emit(NewsSuccess(response));
      } else {
        emit(NewsError('No news found'));
      }
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}