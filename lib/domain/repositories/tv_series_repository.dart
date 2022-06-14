import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_series/tv.dart';
import 'package:ditonton/domain/entities/tv_series/tv_detail.dart';

abstract class TvSeriesRepository {
  Future<Either<Failure, List<Tv>>> getTvAiringToday();
  Future<Either<Failure, List<Tv>>> getTvPopular();
  Future<Either<Failure, List<Tv>>> getTvTopRated();
  Future<Either<Failure, TvDetail>> getDetailTv(int id);
  Future<Either<Failure, List<Tv>>> getTvRecommendation(int id);
  Future<Either<Failure, List<Tv>>> searchTv(String query);
  Future<Either<Failure, String>> saveWatchlistTv(TvDetail tv);
  Future<Either<Failure, String>> removeWatchlistTv(TvDetail tv);
  Future<bool> isAddedToWatchlistTv(int id);
  Future<Either<Failure, List<Tv>>> getWatchlistTv();
}