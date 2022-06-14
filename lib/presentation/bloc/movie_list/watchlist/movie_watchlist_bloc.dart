import 'dart:async';

import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/usecases/get_watchlist_movies.dart';
import 'package:ditonton/domain/usecases/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/save_watchlist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'movie_watchlist_state.dart';

part 'movie_watchlist_event.dart';

class MovieWatchlistBloc
    extends Bloc<MovieWatchlistEvent, MovieWatchlistState> {
  final GetWatchlistMovies _getWatchlistMovies;
  final GetWatchListStatus _getWatchListStatus;
  final RemoveWatchlist _removeWatchlist;
  final SaveWatchlist _saveWatchlist;

  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';
  MovieWatchlistBloc(this._getWatchlistMovies, this._getWatchListStatus,
      this._removeWatchlist, this._saveWatchlist)
      : super(MovieWatchList()) {
    on<OnMovieWatchlist>(_onFetchMovieWatchList);
    on<MovieWatchListStatus>(_onMovieWatchlistStatus);
    on<MovieWatchListAdd>(_onMovieWatchListAdd);
    on<MovieWatchListRemove>(_onMovieWatchListRemove);
  }

  FutureOr<void> _onFetchMovieWatchList(
      OnMovieWatchlist event, Emitter<MovieWatchlistState> emit) async {
    emit(MovieWatchlistLoading());
    final result = await _getWatchlistMovies.execute();

    result.fold((failure) {
      emit(MovieWatchlistError(failure.message));
    }, (data) {
      data.isEmpty
          ? emit(MovieWatchlistEmpty())
          : emit(MovieWatchlistHasData(data));
    });
  }

  FutureOr<void> _onMovieWatchlistStatus(
      MovieWatchListStatus event, Emitter<MovieWatchlistState> emit) async {
    final id = event.id;
    final result = await _getWatchListStatus.execute(id);
    emit(MovieWatchListIsAdded(result));
  }

  FutureOr<void> _onMovieWatchListAdd(
      MovieWatchListAdd event, Emitter<MovieWatchlistState> emit) async {
    final movie = event.movieDetail;

    final result = await _saveWatchlist.execute(movie);
    result.fold((failure) {
      print("bloc insert gagal");
      emit(MovieWatchlistError(failure.message));
    }, (data) {
      print("bloc insert berhasil");
      emit(MovieWatchListMessage("Added to Watchlist"));
    });
  }

  FutureOr<void> _onMovieWatchListRemove(
      MovieWatchListRemove event, Emitter<MovieWatchlistState> emit) async {
    final movie = event.movieDetail;
    final result = await _removeWatchlist.execute(movie);
    result.fold((failure) {
      print("bloc hapus gagal");
      emit(MovieWatchlistError(failure.message));
    }, (data) {
      print("bloc hapus berhasil");
      emit(MovieWatchListMessage("Removed from Watchlist"));
    });
  }
}
