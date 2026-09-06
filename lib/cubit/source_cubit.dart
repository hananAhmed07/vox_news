import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/api_manager.dart';
import '../models/source_response.dart';
import 'source_state.dart';

class SourceCubit extends Cubit<SourceState> {
  SourceCubit() : super(SourceInitial());

  Future<void> getSources({
    required String categoryId,
    required String language,
  }) async {
    emit(SourceLoading());

    try {
      SourceResponse? response = await ApiManager.getSources(
        categoryId,
        language,
      );

      if (response != null) {
        emit(SourceSuccess(response));
      } else {
        emit(SourceError('No sources found'));
      }
    } catch (e) {
      emit(SourceError(e.toString()));
    }
  }
}