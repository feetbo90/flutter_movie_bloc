import 'package:ditonton/data/models/tv_series/tv_season_model.dart';
import 'package:ditonton/domain/entities/tv_series/season.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tvModel = TvSeasonModel(
    name: 'obi',
    posterPath: 'posterPath',
    id: 1,
    episodeCount: 3,
    seasonNumber: 3,
    overview: 'overview',
  );

  final tv = Season(
    name: 'obi',
    posterPath: 'posterPath',
    id: 1,
    episodeCount: 3,
    seasonNumber: 3,
    overview: 'overview',
  );

  test('should be a subclass of tv entity', () async {
    final result = tvModel.toEntity();
    expect(result, tv);
  });
}
