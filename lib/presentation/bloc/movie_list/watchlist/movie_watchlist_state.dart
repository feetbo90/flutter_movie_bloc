part of 'movie_watchlist_bloc.dart';

abstract class MovieWatchlistState extends Equatable {}

class MovieWatchList extends MovieWatchlistState {
  @override
  List<Object?> get props => [];
}

class MovieWatchlistEmpty extends MovieWatchlistState {
  @override
  List<Object?> get props => [];
}

class MovieWatchlistLoading extends MovieWatchlistState {
  @override
  List<Object?> get props => [];
}

class MovieWatchlistError extends MovieWatchlistState {
  final String message;

  MovieWatchlistError(this.message);

  @override
  List<Object> get props => [message];
}

class MovieWatchlistHasData extends MovieWatchlistState {
  final List<Movie> result;

  MovieWatchlistHasData(this.result);

  @override
  List<Object> get props => [result];
}

class MovieWatchListIsAdded extends MovieWatchlistState {
  final bool isAdded;

  MovieWatchListIsAdded(this.isAdded);

  @override
  List<Object?> get props => [isAdded];
}

class MovieWatchListMessage extends MovieWatchlistState {
  final String message;

  MovieWatchListMessage(this.message);

  @override
  List<Object?> get props => [message];
}
