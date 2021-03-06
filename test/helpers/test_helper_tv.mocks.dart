// Mocks generated by Mockito 5.1.0 from annotations
// in ditonton/test/helpers/test_helper_tv.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;
import 'dart:convert' as _i16;
import 'dart:typed_data' as _i17;

import 'package:dartz/dartz.dart' as _i2;
import 'package:ditonton/common/failure.dart' as _i7;
import 'package:ditonton/data/datasources/db/database_tv_series_helper.dart'
    as _i14;
import 'package:ditonton/data/datasources/local/tv_series_local_data_sources.dart'
    as _i12;
import 'package:ditonton/data/datasources/remote/tv_series_remote_data_sources.dart'
    as _i10;
import 'package:ditonton/data/models/tv_series/tv_model.dart' as _i11;
import 'package:ditonton/data/models/tv_series/tv_series_detail.dart' as _i3;
import 'package:ditonton/data/models/tv_series/tv_series_table.dart' as _i13;
import 'package:ditonton/domain/entities/tv_series/tv.dart' as _i8;
import 'package:ditonton/domain/entities/tv_series/tv_detail.dart' as _i9;
import 'package:ditonton/domain/repositories/tv_series_repository.dart' as _i5;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i15;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeTvSeriesDetail_1 extends _i1.Fake implements _i3.TvSeriesDetail {}

class _FakeResponse_2 extends _i1.Fake implements _i4.Response {}

class _FakeStreamedResponse_3 extends _i1.Fake implements _i4.StreamedResponse {
}

/// A class which mocks [TvSeriesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesRepository extends _i1.Mock
    implements _i5.TvSeriesRepository {
  MockTvSeriesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>> getTvAiringToday() =>
      (super.noSuchMethod(Invocation.method(#getTvAiringToday, []),
              returnValue: Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>.value(
                  _FakeEither_0<_i7.Failure, List<_i8.Tv>>()))
          as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>> getTvPopular() =>
      (super.noSuchMethod(Invocation.method(#getTvPopular, []),
              returnValue: Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>.value(
                  _FakeEither_0<_i7.Failure, List<_i8.Tv>>()))
          as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>> getTvTopRated() =>
      (super.noSuchMethod(Invocation.method(#getTvTopRated, []),
              returnValue: Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>.value(
                  _FakeEither_0<_i7.Failure, List<_i8.Tv>>()))
          as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i9.TvDetail>> getDetailTv(int? id) =>
      (super.noSuchMethod(Invocation.method(#getDetailTv, [id]),
              returnValue: Future<_i2.Either<_i7.Failure, _i9.TvDetail>>.value(
                  _FakeEither_0<_i7.Failure, _i9.TvDetail>()))
          as _i6.Future<_i2.Either<_i7.Failure, _i9.TvDetail>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>> getTvRecommendation(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvRecommendation, [id]),
              returnValue: Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>.value(
                  _FakeEither_0<_i7.Failure, List<_i8.Tv>>()))
          as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>> searchTv(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTv, [query]),
              returnValue: Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>.value(
                  _FakeEither_0<_i7.Failure, List<_i8.Tv>>()))
          as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> saveWatchlistTv(
          _i9.TvDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlistTv, [tv]),
              returnValue: Future<_i2.Either<_i7.Failure, String>>.value(
                  _FakeEither_0<_i7.Failure, String>()))
          as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> removeWatchlistTv(
          _i9.TvDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistTv, [tv]),
              returnValue: Future<_i2.Either<_i7.Failure, String>>.value(
                  _FakeEither_0<_i7.Failure, String>()))
          as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<bool> isAddedToWatchlistTv(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlistTv, [id]),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>> getWatchlistTv() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTv, []),
              returnValue: Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>.value(
                  _FakeEither_0<_i7.Failure, List<_i8.Tv>>()))
          as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>);
}

/// A class which mocks [TvSeriesRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesRemoteDataSource extends _i1.Mock
    implements _i10.TvSeriesRemoteDataSource {
  MockTvSeriesRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i11.TvModel>> getTvAiringToday() =>
      (super.noSuchMethod(Invocation.method(#getTvAiringToday, []),
              returnValue: Future<List<_i11.TvModel>>.value(<_i11.TvModel>[]))
          as _i6.Future<List<_i11.TvModel>>);
  @override
  _i6.Future<List<_i11.TvModel>> getTvPopular() =>
      (super.noSuchMethod(Invocation.method(#getTvPopular, []),
              returnValue: Future<List<_i11.TvModel>>.value(<_i11.TvModel>[]))
          as _i6.Future<List<_i11.TvModel>>);
  @override
  _i6.Future<List<_i11.TvModel>> getTvTopRated() =>
      (super.noSuchMethod(Invocation.method(#getTvTopRated, []),
              returnValue: Future<List<_i11.TvModel>>.value(<_i11.TvModel>[]))
          as _i6.Future<List<_i11.TvModel>>);
  @override
  _i6.Future<_i3.TvSeriesDetail> getTvSeriesDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvSeriesDetail, [id]),
              returnValue:
                  Future<_i3.TvSeriesDetail>.value(_FakeTvSeriesDetail_1()))
          as _i6.Future<_i3.TvSeriesDetail>);
  @override
  _i6.Future<List<_i11.TvModel>> getTvRecommendation(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvRecommendation, [id]),
              returnValue: Future<List<_i11.TvModel>>.value(<_i11.TvModel>[]))
          as _i6.Future<List<_i11.TvModel>>);
  @override
  _i6.Future<List<_i11.TvModel>> searchTv(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTv, [query]),
              returnValue: Future<List<_i11.TvModel>>.value(<_i11.TvModel>[]))
          as _i6.Future<List<_i11.TvModel>>);
}

/// A class which mocks [TvSeriesLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesLocalDataSource extends _i1.Mock
    implements _i12.TvSeriesLocalDataSource {
  MockTvSeriesLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<String> insertWatchlistTv(_i13.TvSeriesTable? tvSeriesTable) =>
      (super.noSuchMethod(
          Invocation.method(#insertWatchlistTv, [tvSeriesTable]),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<String> removeWatchlistTv(_i13.TvSeriesTable? tvSeriesTable) =>
      (super.noSuchMethod(
          Invocation.method(#removeWatchlistTv, [tvSeriesTable]),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i13.TvSeriesTable?> getTvById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvById, [id]),
              returnValue: Future<_i13.TvSeriesTable?>.value())
          as _i6.Future<_i13.TvSeriesTable?>);
  @override
  _i6.Future<List<_i13.TvSeriesTable>> getWatchlistTv() => (super.noSuchMethod(
          Invocation.method(#getWatchlistTv, []),
          returnValue:
              Future<List<_i13.TvSeriesTable>>.value(<_i13.TvSeriesTable>[]))
      as _i6.Future<List<_i13.TvSeriesTable>>);
}

/// A class which mocks [DatabaseHelperTv].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelperTv extends _i1.Mock implements _i14.DatabaseHelperTv {
  MockDatabaseHelperTv() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i15.Database?> get database =>
      (super.noSuchMethod(Invocation.getter(#database),
              returnValue: Future<_i15.Database?>.value())
          as _i6.Future<_i15.Database?>);
  @override
  _i6.Future<void> insertCacheTransaction(
          List<_i13.TvSeriesTable>? tvTable, String? category) =>
      (super.noSuchMethod(
          Invocation.method(#insertCacheTransaction, [tvTable, category]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getCacheTv(String? category) =>
      (super.noSuchMethod(Invocation.method(#getCacheTv, [category]),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i6.Future<List<Map<String, dynamic>>>);
  @override
  _i6.Future<int> clearCache(String? category) =>
      (super.noSuchMethod(Invocation.method(#clearCache, [category]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<int> insertWatchlistTv(_i13.TvSeriesTable? tvTable) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistTv, [tvTable]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<int> removeWatchListTv(_i13.TvSeriesTable? tvTable) =>
      (super.noSuchMethod(Invocation.method(#removeWatchListTv, [tvTable]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<Map<String, dynamic>?> getTvById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i6.Future<Map<String, dynamic>?>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlistTv() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTv, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i6.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i16.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i16.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i16.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i16.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i17.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i17.Uint8List>.value(_i17.Uint8List(0)))
          as _i6.Future<_i17.Uint8List>);
  @override
  _i6.Future<_i4.StreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_3()))
          as _i6.Future<_i4.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}
