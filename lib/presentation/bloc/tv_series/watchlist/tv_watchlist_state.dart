part of 'tv_watchlist_bloc.dart';

abstract class TvWatchlistState extends Equatable {}

class TvWatchList extends TvWatchlistState {
  @override
  List<Object?> get props => [];
}

class TvWatchlistEmpty extends TvWatchlistState {
  @override
  List<Object?> get props => [];
}

class TvWatchlistLoading extends TvWatchlistState {
  @override
  List<Object?> get props => [];
}

class TvWatchlistError extends TvWatchlistState {
  final String message;

  TvWatchlistError(this.message);

  @override
  List<Object> get props => [message];
}

class TvWatchlistHasData extends TvWatchlistState {
  final List<Tv> result;

  TvWatchlistHasData(this.result);

  @override
  List<Object> get props => [result];
}

class TvWatchListIsAdded extends TvWatchlistState {
  final bool isAdded;

  TvWatchListIsAdded(this.isAdded);

  @override
  List<Object?> get props => [isAdded];
}

class TvWatchListMessage extends TvWatchlistState {
  final String message;

  TvWatchListMessage(this.message);

  @override
  List<Object?> get props => [message];
}
