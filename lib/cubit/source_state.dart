import '../models/source_response.dart';

abstract class SourceState {}

class SourceInitial extends SourceState {}

class SourceLoading extends SourceState {}

class SourceSuccess extends SourceState {
  final SourceResponse sourceResponse;

  SourceSuccess(this.sourceResponse);
}

class SourceError extends SourceState {
  final String message;

  SourceError(this.message);
}