
import 'dart:convert';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/movie_remote_data_source.dart';
import 'package:ditonton/data/models/tv_series/tv_response.dart';
import 'package:ditonton/data/models/tv_series/tv_series_detail.dart';
import 'package:http/http.dart' as http;
import 'package:ditonton/data/models/tv_series/tv_model.dart';

abstract class TvSeriesRemoteDataSource {
  Future<List<TvModel>> getTvAiringToday();
  Future<List<TvModel>> getTvPopular();
  Future<List<TvModel>> getTvTopRated();
  Future<TvSeriesDetail> getTvSeriesDetail(int id);
  Future<List<TvModel>> getTvRecommendation(int id);
  Future<List<TvModel>> searchTv(String query);
}

class TvSeriesRemoteDataSourceImpl implements TvSeriesRemoteDataSource {

  final http.Client client;

  TvSeriesRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TvModel>> getTvAiringToday() async{
    final response = await client.get(Uri.parse('${MovieRemoteDataSourceImpl.BASE_URL}/tv/airing_today?${MovieRemoteDataSourceImpl.API_KEY}'));

    if(response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvModel>> getTvPopular() async{
    final response = await client.get(Uri.parse('${MovieRemoteDataSourceImpl.BASE_URL}/tv/top_rated?${MovieRemoteDataSourceImpl.API_KEY}'));
    if(response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvModel>> getTvTopRated() async{
    final response = await client.get(Uri.parse('${MovieRemoteDataSourceImpl.BASE_URL}/tv/top_rated?${MovieRemoteDataSourceImpl.API_KEY}'));
    if(response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TvSeriesDetail> getTvSeriesDetail(int id) async{
    final response = await client.get(Uri.parse('${MovieRemoteDataSourceImpl.BASE_URL}/tv/$id?${MovieRemoteDataSourceImpl.API_KEY}'));
    if(response.statusCode == 200) {
      return TvSeriesDetail.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvModel>> getTvRecommendation(int id) async {
    final response = await client
        .get(Uri.parse('${MovieRemoteDataSourceImpl.BASE_URL}/tv/$id/recommendations?${MovieRemoteDataSourceImpl.API_KEY}'));
    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).tvList;
    }
    throw ServerException();
  }

  @override
  Future<List<TvModel>> searchTv(String query) async {
    final response = await client
        .get(Uri.parse('${MovieRemoteDataSourceImpl.BASE_URL}/search/tv?${MovieRemoteDataSourceImpl.API_KEY}&query=$query'));
    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }
}