import 'dart:convert';

import 'package:ditonton/data/models/tv_series/tv_model.dart';
import 'package:ditonton/data/models/tv_series/tv_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json_reader.dart';

void main() {
  final tvModel = TvModel(
      backdropPath: "/path.jpg",
      genreIds: [1, 2, 3, 4],
      id: 1,
      originalLanguage: "en",
      originalName: "Obi-Wan Kenobi",
      overview:
          "During the reign of the Galactic Empire, former Jedi Master, Obi-Wan Kenobi, embarks on a crucial mission to confront allies turned enemies and face the wrath of the Empire.",
      popularity: 3049.229,
      posterPath: "/path.jpg",
      voteAverage: 8.2,
      voteCount: 205,
      originCountry: ["US"],
      name: "Obi-Wan Kenobi");
  final tvResponseModel = TvResponse(tvList: <TvModel>[tvModel]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/tv_series/airing_today.json'));
      // act
      final result = TvResponse.fromJson(jsonMap);
      // assert
      expect(result, tvResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tvResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "results": [
          {
            "backdrop_path": "/path.jpg",
            "genre_ids": [
              1,
              2,
              3,
              4
            ],
            "id": 1,
            "name": "Obi-Wan Kenobi",
            "origin_country": [
              "US"
            ],
            "original_language": "en",
            "original_name": "Obi-Wan Kenobi",
            "overview": "During the reign of the Galactic Empire, former Jedi Master, Obi-Wan Kenobi, embarks on a crucial mission to confront allies turned enemies and face the wrath of the Empire.",
            "popularity": 3049.229,
            "poster_path": "/path.jpg",
            "vote_average": 8.2,
            "vote_count": 205
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
