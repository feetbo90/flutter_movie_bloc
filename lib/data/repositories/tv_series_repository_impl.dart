import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/datasources/local/tv_series_local_data_sources.dart';
import 'package:ditonton/data/datasources/remote/tv_series_remote_data_sources.dart';
import 'package:ditonton/data/models/tv_series/tv_series_table.dart';
import 'package:ditonton/domain/entities/tv_series/tv.dart';
import 'package:ditonton/domain/entities/tv_series/tv_detail.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';

class TvSeriesRepositoryImpl implements TvSeriesRepository {
  final TvSeriesRemoteDataSource remoteTvSeriesDataSources;
  final TvSeriesLocalDataSource tvSeriesLocalDataSource;

  TvSeriesRepositoryImpl(
      {required this.remoteTvSeriesDataSources,
      required this.tvSeriesLocalDataSource});

  @override
  Future<Either<Failure, List<Tv>>> getTvAiringToday() async {
    try {
      final result = await remoteTvSeriesDataSources.getTvAiringToday();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect the network'));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTvPopular() async{
    try {
      final result = await remoteTvSeriesDataSources.getTvPopular();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect the network'));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTvTopRated() async{
    try {
      final result = await remoteTvSeriesDataSources.getTvTopRated();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect the network'));
    }
  }

  @override
  Future<Either<Failure, TvDetail>> getDetailTv(int id) async {
    try {
      final result = await remoteTvSeriesDataSources.getTvSeriesDetail(id);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed connect to network'));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTvRecommendation(int id) async {
    try {
      final result = await remoteTvSeriesDataSources.getTvRecommendation(id);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerFailure {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed connect to network'));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> searchTv(String query) async {
    try {
      final result = await remoteTvSeriesDataSources.searchTv(query);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getWatchlistTv() async{
    final result = await tvSeriesLocalDataSource.getWatchlistTv();
    return Right(result.map((data) => data.toEntity()).toList());
  }

  @override
  Future<bool> isAddedToWatchlistTv(int id) async{
    final result = await tvSeriesLocalDataSource.getTvById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, String>> removeWatchlistTv(TvDetail tv) async{
    try {
      final result =
      await tvSeriesLocalDataSource.removeWatchlistTv(TvSeriesTable.fromEntity(tv));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> saveWatchlistTv(TvDetail tv) async{
    try {
      final result =
      await tvSeriesLocalDataSource.insertWatchlistTv(TvSeriesTable.fromEntity(tv));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }
}
