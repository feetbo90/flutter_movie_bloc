import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_series/tv_detail.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';

class GetDetailTv {
  final TvSeriesRepository repository;

  GetDetailTv(this.repository);

  Future<Either<Failure, TvDetail>> execute(int id) {
    return repository.getDetailTv(id);
  }
}