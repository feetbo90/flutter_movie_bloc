import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_series/tv.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';

class GetTvRecommendation {
  final TvSeriesRepository repository;

  GetTvRecommendation(this.repository);

  Future<Either<Failure, List<Tv>>> execute(int id) {
    return repository.getTvRecommendation(id);
  }
}