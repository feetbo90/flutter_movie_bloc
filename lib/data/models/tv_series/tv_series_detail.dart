import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/data/models/tv_series/tv_season_model.dart';
import 'package:ditonton/domain/entities/tv_series/tv_detail.dart';
import 'package:equatable/equatable.dart';

class TvSeriesDetail extends Equatable {
  TvSeriesDetail({
    required this.seasons,
    required this.adult,
    required this.backdropPath,
    required this.firstAirDate,
    required this.genres,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.lastAirDate,
    required this.name,
    required this.nextEpisodeToAir,
    required this.posterPath,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  List<GenreModel> genres;
  List<TvSeasonModel> seasons;
  bool adult;

  int id;
  bool inProduction;
  String name;
  int? numberOfEpisodes;
  dynamic nextEpisodeToAir;
  DateTime firstAirDate;
  DateTime lastAirDate;
  int? numberOfSeasons;
  String originalLanguage;
  String originalName;
  String overview;
  String backdropPath;
  String homepage;
  String posterPath;
  String status;
  String tagline;
  String type;
  double voteAverage;
  double popularity;
  int voteCount;

  factory TvSeriesDetail.fromJson(Map<String, dynamic> json) => TvSeriesDetail(
        seasons: List<TvSeasonModel>.from(
            json["seasons"].map((x) => TvSeasonModel.fromJson(x))),
        genres: List<GenreModel>.from(
            json["genres"].map((x) => GenreModel.fromJson(x))),
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        firstAirDate: DateTime.parse(json["first_air_date"]),
        homepage: json["homepage"],
        id: json["id"],
        inProduction: json["in_production"],
        lastAirDate: DateTime.parse(json["last_air_date"]),
        name: json["name"],
        nextEpisodeToAir: json["next_episode_to_air"],
        numberOfEpisodes: json["number_of_episodes"],
        numberOfSeasons: json["number_of_seasons"],
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        status: json["status"],
        tagline: json["tagline"],
        type: json["type"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "adult": adult,
        "backdrop_path": backdropPath,
        "first_air_date":
            "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "homepage": homepage,
        "id": id,
        "in_production": inProduction,
        "last_air_date":
            "${lastAirDate.year.toString().padLeft(4, '0')}-${lastAirDate.month.toString().padLeft(2, '0')}-${lastAirDate.day.toString().padLeft(2, '0')}",
        "name": name,
        "next_episode_to_air": nextEpisodeToAir,
        "number_of_episodes": numberOfEpisodes,
        "number_of_seasons": numberOfSeasons,
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "status": status,
        "tagline": tagline,
        "type": type,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  TvDetail toEntity(){
    return TvDetail(

        seasons: seasons.map((e) => e.toEntity()).toList(),
        genres: genres.map((e) => e.toEntity()).toList(),
        adult: adult,
        backdropPath: backdropPath,
        homepage: homepage,
        id: id,
        inProduction: inProduction,
        name: name,
        numberOfEpisodes: numberOfEpisodes,
        numberOfSeasons: numberOfSeasons,
        originalLanguage: originalLanguage,
        originalName: originalName,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        status: status,
        tagline: tagline,
        type: type,
        voteAverage: voteAverage,
        voteCount: voteCount
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        seasons,
        genres,
        adult,
        backdropPath,
        homepage,
        id,
        inProduction,
        name,
        numberOfEpisodes,
        numberOfSeasons,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        status,
        tagline,
        type,
        voteAverage,
        voteCount,
      ];
}
