part of 'movie_watchlist_bloc.dart';

abstract class MovieWatchlistEvent extends Equatable {}

class OnMovieWatchlist extends MovieWatchlistEvent {
  OnMovieWatchlist();

  @override
  List<Object> get props => [];
}

class MovieWatchListStatus extends MovieWatchlistEvent {
  final int id;

  MovieWatchListStatus(this.id);

  @override
  List<Object?> get props => [id];
}

class MovieWatchListAdd extends MovieWatchlistEvent {
  final MovieDetail movieDetail;

  MovieWatchListAdd(this.movieDetail);

  @override
  List<Object?> get props => [movieDetail];
}

class MovieWatchListRemove extends MovieWatchlistEvent {
  final MovieDetail movieDetail;

  MovieWatchListRemove(this.movieDetail);

  @override
  List<Object?> get props => [movieDetail];
}