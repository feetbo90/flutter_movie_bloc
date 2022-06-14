import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series/tv.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_airing_today.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_popular.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_top_rated.dart';
import 'package:flutter/cupertino.dart';

class TvSeriesListNotifier extends ChangeNotifier {
  // tv airing today
  var _tvAiringToday = <Tv>[];

  List<Tv> get tvAiringToday => _tvAiringToday;
  RequestState _tvAiringTodayState = RequestState.Empty;

  RequestState get tvAiringTodayState => _tvAiringTodayState;
  final GetTvAiringToday getTvAiringToday;

  // tv top_rated
  var _tvPopular = <Tv>[];

  List<Tv> get tvPopular => _tvPopular;
  RequestState _tvPopularState = RequestState.Empty;

  RequestState get tvPopularState => _tvPopularState;
  final GetTvPopular getTvPopular;

  // tv top rated
  var _tvTopRated = <Tv>[];

  List<Tv> get tvTopRated => _tvTopRated;
  RequestState _tvTopRatedState = RequestState.Empty;

  RequestState get tvTopRatedState => _tvTopRatedState;
  final GetTvTopRated getTvTopRated;

  String _message = '';

  String get message => _message;

  TvSeriesListNotifier({
    required this.getTvAiringToday,
    required this.getTvPopular,
    required this.getTvTopRated,
  });

  Future<void> fetchTvAiringToday() async {
    _tvAiringTodayState = RequestState.Loading;
    notifyListeners();

    final result = await getTvAiringToday.execute();
    result.fold(
      (failure) {
        _tvAiringTodayState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSeriesData) {
        _tvAiringTodayState = RequestState.Loaded;
        _tvAiringToday = tvSeriesData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTvPopular() async {
    _tvPopularState = RequestState.Loading;
    notifyListeners();

    final result = await getTvPopular.execute();
    result.fold(
      (failure) {
        _tvPopularState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSeriesData) {
        _tvPopularState = RequestState.Loaded;
        _tvPopular = tvSeriesData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTvTopRated() async {
    _tvTopRatedState = RequestState.Loading;
    notifyListeners();

    final result = await getTvTopRated.execute();
    result.fold(
      (failure) {
        _tvTopRatedState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSeriesData) {
        _tvTopRatedState = RequestState.Loaded;
        _tvTopRated = tvSeriesData;
        notifyListeners();
      },
    );
  }
}
