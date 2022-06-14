import 'dart:async';

import 'package:ditonton/domain/entities/tv_series/tv.dart';
import 'package:ditonton/domain/entities/tv_series/tv_detail.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_watchlist_status.dart';
import 'package:ditonton/domain/usecases/tv_series/get_watchlist_tv.dart';
import 'package:ditonton/domain/usecases/tv_series/remove_watchlist_tv.dart';
import 'package:ditonton/domain/usecases/tv_series/save_watchlist_tv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'tv_watchlist_state.dart';

part 'tv_watchlist_event.dart';

class TvWatchlistBloc
    extends Bloc<TvWatchlistEvent, TvWatchlistState> {
  final GetWatchlistTv _getWatchlistTvs;
  final GetTvWatchlistStatus _getWatchListStatus;
  final RemoveWatchlistTv _removeWatchlist;
  final SaveWatchlistTv _saveWatchlist;

  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';
  TvWatchlistBloc(this._getWatchlistTvs, this._getWatchListStatus,
      this._removeWatchlist, this._saveWatchlist)
      : super(TvWatchList()) {
    on<OnTvWatchlist>(_onFetchTvWatchList);
    on<TvWatchListStatus>(_onTvWatchlistStatus);
    on<TvWatchListAdd>(_onTvWatchListAdd);
    on<TvWatchListRemove>(_onTvWatchListRemove);
  }

  FutureOr<void> _onFetchTvWatchList(
      OnTvWatchlist event, Emitter<TvWatchlistState> emit) async {
    emit(TvWatchlistLoading());
    final result = await _getWatchlistTvs.execute();

    result.fold((failure) {
      emit(TvWatchlistError(failure.message));
    }, (data) {
      data.isEmpty
          ? emit(TvWatchlistEmpty())
          : emit(TvWatchlistHasData(data));
    });
  }

  FutureOr<void> _onTvWatchlistStatus(
      TvWatchListStatus event, Emitter<TvWatchlistState> emit) async {
    final id = event.id;
    final result = await _getWatchListStatus.execute(id);
    emit(TvWatchListIsAdded(result));
  }

  FutureOr<void> _onTvWatchListAdd(
      TvWatchListAdd event, Emitter<TvWatchlistState> emit) async {
    final Tv = event.tvDetail;

    final result = await _saveWatchlist.execute(Tv);
    result.fold((failure) {
      print("bloc insert gagal");
      emit(TvWatchlistError(failure.message));
    }, (data) {
      print("bloc insert berhasil");
      emit(TvWatchListMessage("Added to Watchlist"));
    });
  }

  FutureOr<void> _onTvWatchListRemove(
      TvWatchListRemove event, Emitter<TvWatchlistState> emit) async {
    final Tv = event.tvDetail;
    final result = await _removeWatchlist.execute(Tv);
    result.fold((failure) {
      print("bloc hapus gagal");
      emit(TvWatchlistError(failure.message));
    }, (data) {
      print("bloc hapus berhasil");
      emit(TvWatchListMessage("Removed from Watchlist"));
    });
  }
}
