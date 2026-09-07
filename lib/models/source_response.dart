import 'source.dart';

class SourceResponse {
  String? status;
  List<Source>? sources;

  SourceResponse({
    this.status,
    this.sources,
  });

  SourceResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    if (json['sources'] != null) {
      sources = <Source>[];

      for (var source in json['sources']) {
        sources!.add(
          Source.fromJson(source),
        );
      }
    }
  }
}