

import 'package:ditonton/data/models/tv_series/tv_model.dart';
import 'package:ditonton/data/models/tv_series/tv_series_detail.dart';
import 'package:ditonton/domain/entities/tv_series/tv.dart';
import 'package:ditonton/domain/entities/tv_series/tv_detail.dart';
import 'package:equatable/equatable.dart';

class TvSeriesTable extends Equatable {
  final int id;
  final String? name;
  final String? posterPath;
  final String? overview;

  TvSeriesTable({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.overview
  });

  factory TvSeriesTable.fromEntity(TvDetail tvDetail) => TvSeriesTable(
      id: tvDetail.id,
      name: tvDetail.name,
      posterPath: tvDetail.posterPath,
      overview: tvDetail.overview
  );

  factory TvSeriesTable.fromMap(Map<String, dynamic> map) => TvSeriesTable(
    id: map["id"],
    name: map['name'],
    posterPath: map['posterPath'],
    overview: map['overview'],
  );

  factory TvSeriesTable.fromDTO(TvModel tvModel) => TvSeriesTable(
      id: tvModel.id,
      name: tvModel.name,
      posterPath: tvModel.posterPath,
      overview: tvModel.overview
  );
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'posterPath': posterPath,
    'overview': overview,
  };

  Tv toEntity() => Tv.watchlist(
    id: id,
    name: name,
    posterPath: posterPath,
    overview: overview,
  );

  @override
  List<Object?> get props => [
    id,
    name,
    posterPath,
    overview,
  ];

}