import '../models/source.dart';

abstract class SourceState {}

class SourceInitial extends SourceState {}

class SourceLoading extends SourceState {}

class SourceSuccess extends SourceState {
  final List<Source> sources;

  SourceSuccess(this.sources);
}

class SourceError extends SourceState {
  final String message;

  SourceError(this.message);
}