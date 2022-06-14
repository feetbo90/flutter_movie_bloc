import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_series/tv_detail.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';

class SaveWatchlistTv {
  final TvSeriesRepository repository;

  SaveWatchlistTv(this.repository);

  Future<Either<Failure, String>> execute(TvDetail tv) {
    return repository.saveWatchlistTv(tv);
  }
}