import 'package:ditonton/data/datasources/db/database_tv_series_helper.dart';
import 'package:ditonton/data/datasources/local/tv_series_local_data_sources.dart';
import 'package:ditonton/data/datasources/remote/tv_series_remote_data_sources.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  TvSeriesRepository,
  TvSeriesRemoteDataSource,
  TvSeriesLocalDataSource,
  DatabaseHelperTv,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}