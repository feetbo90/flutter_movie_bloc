import 'package:ditonton/data/models/tv_series/tv_model.dart';
import 'package:ditonton/domain/entities/tv_series/tv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tvModel = TvModel(
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    overview: 'overview',
    posterPath: 'posterPath',
    voteAverage: 1,
    voteCount: 1,
    name: 'title',
    originCountry: ["originCountry"],
    originalLanguage: 'english',
    popularity: 4.5,
    originalName: 'originalName',
  );

  final tv = Tv(
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    overview: 'overview',
    posterPath: 'posterPath',
    voteAverage: 1,
    voteCount: 1,
    name: 'title',
    originCountry: ["originCountry"],
    originalLanguage: 'english',
    popularity: 4.5,
    originalName: 'originalName',
  );

  test('should be a subclass of Movie entity', () async {
    final result = tvModel.toEntity();
    expect(result, tv);
  });
}
