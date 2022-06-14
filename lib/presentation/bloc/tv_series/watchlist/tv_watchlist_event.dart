part of 'tv_watchlist_bloc.dart';

abstract class TvWatchlistEvent extends Equatable {}

class OnTvWatchlist extends TvWatchlistEvent {
  OnTvWatchlist();

  @override
  List<Object> get props => [];
}

class TvWatchListStatus extends TvWatchlistEvent {
  final int id;

  TvWatchListStatus(this.id);

  @override
  List<Object?> get props => [id];
}

class TvWatchListAdd extends TvWatchlistEvent {
  final TvDetail tvDetail;

  TvWatchListAdd(this.tvDetail);

  @override
  List<Object?> get props => [tvDetail];
}

class TvWatchListRemove extends TvWatchlistEvent {
  final TvDetail tvDetail;

  TvWatchListRemove(this.tvDetail);

  @override
  List<Object?> get props => [tvDetail];
}