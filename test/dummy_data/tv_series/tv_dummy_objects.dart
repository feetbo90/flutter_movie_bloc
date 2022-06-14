import 'package:ditonton/data/models/tv_series/tv_series_table.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/tv_series/tv.dart';
import 'package:ditonton/domain/entities/tv_series/tv_detail.dart';

final testTvTable = TvSeriesTable(
  id: 1,
  name: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);
final testWatchlistTv = Tv.watchlist(
  id: 1,
  name: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTvMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'name': 'title',
};

final testTvDetail = TvDetail(
  adult: false,
  backdropPath: 'backdropPath',
  homepage: "https://google.com",
  id: 1,
  originalLanguage: 'en',
  overview: 'overview',
  popularity: 1,
  posterPath: 'posterPath',
  status: 'Status',
  tagline: 'Tagline',
  voteAverage: 1,
  voteCount: 1,
  name: 'title',
  numberOfEpisodes: null,
  seasons: [],
  type: '',
  originalName: '',
  inProduction: true,
  numberOfSeasons: null,
  genres: [Genre(id: 1, name: 'Action')],
);
