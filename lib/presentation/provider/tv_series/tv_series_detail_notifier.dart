import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series/tv.dart';
import 'package:ditonton/domain/entities/tv_series/tv_detail.dart';
import 'package:ditonton/domain/usecases/tv_series/get_detail_tv.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_recommendation.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_watchlist_status.dart';
import 'package:ditonton/domain/usecases/tv_series/remove_watchlist_tv.dart';
import 'package:ditonton/domain/usecases/tv_series/save_watchlist_tv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TvSeriesDetailNotifier extends ChangeNotifier {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetDetailTv getDetailTv;
  late TvDetail _tvDetail;
  TvDetail get tvDetail => _tvDetail;
  RequestState _tvState = RequestState.Empty;
  RequestState get tvState => _tvState;

  final GetTvRecommendation getTvRecommendation;
  RequestState _tvRecommendationState = RequestState.Empty;
  RequestState get tvRecommendationState => _tvRecommendationState;
  List<Tv> _tvRecommendations = [];
  List<Tv> get tvRecommendations => _tvRecommendations;

  final SaveWatchlistTv saveWatchlistTv;
  final GetTvWatchlistStatus getTvWatchListStatus;
  final RemoveWatchlistTv removeWatchlistTv;


  TvSeriesDetailNotifier({
    required this.getDetailTv,
    required this.getTvRecommendation,
    required this.getTvWatchListStatus,
    required this.saveWatchlistTv,
    required this.removeWatchlistTv,
  });

  String _message = '';

  String get message => _message;

  bool _isAddedtoWatchlist = false;

  bool get isAddedToWatchlist => _isAddedtoWatchlist;

  Future<void> fetchTvDetail(int id) async {
    _tvState = RequestState.Loading;
    notifyListeners();
    final detailResult = await getDetailTv.execute(id);
    final recommendationResult = await getTvRecommendation.execute(id);
    detailResult.fold(
      (failure) {
        _tvState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (dataDetail) {
        _tvDetail = dataDetail;
        _tvState = RequestState.Loaded;
        notifyListeners();
        recommendationResult.fold(
              (failure) {
            _tvRecommendationState = RequestState.Error;
            _message = failure.message;
          },
              (recommendation) {
            _tvRecommendationState = RequestState.Loaded;
            _tvRecommendations = recommendation;
          },
        );
        _tvRecommendationState = RequestState.Loaded;
        notifyListeners();
      },
    );
  }

  String _watchlistMessage = '';
  String get watchlistMessage => _watchlistMessage;

  Future<void> addWatchlistTv(TvDetail tv) async {
    final result = await saveWatchlistTv.execute(tv);

    await result.fold(
          (failure) async {
        _watchlistMessage = failure.message;
      },
          (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistTvStatus(tv.id);
  }

  Future<void> removeFromWatchlistTv(TvDetail tv) async {
    final result = await removeWatchlistTv.execute(tv);

    await result.fold(
          (failure) async {
        _watchlistMessage = failure.message;
      },
          (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistTvStatus(tv.id);
  }

  Future<void> loadWatchlistTvStatus(int id) async {
    final result = await getTvWatchListStatus.execute(id);
    _isAddedtoWatchlist = result;
    notifyListeners();
  }
}
