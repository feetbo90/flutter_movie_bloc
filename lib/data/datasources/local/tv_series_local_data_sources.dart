

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/db/database_tv_series_helper.dart';
import 'package:ditonton/data/models/tv_series/tv_series_table.dart';

abstract class TvSeriesLocalDataSource {
  Future<String> insertWatchlistTv(TvSeriesTable tvSeriesTable);
  Future<String> removeWatchlistTv(TvSeriesTable tvSeriesTable);
  Future<TvSeriesTable?> getTvById(int id);
  Future<List<TvSeriesTable>> getWatchlistTv();
}

class TvSeriesLocalDataSourceImpl implements TvSeriesLocalDataSource {
  final DatabaseHelperTv databaseHelperTv;
  TvSeriesLocalDataSourceImpl({required this.databaseHelperTv});

  @override
  Future<String> insertWatchlistTv(TvSeriesTable tvSeriesTable) async {
    try {
      await databaseHelperTv.insertWatchlistTv(tvSeriesTable);
      return "Added to Watchlist";
    } catch(e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<List<TvSeriesTable>> getWatchlistTv() async {
    final result = await databaseHelperTv.getWatchlistTv();
    return result.map((data) => TvSeriesTable.fromMap(data)).toList();
  }

  @override
  Future<TvSeriesTable?> getTvById(int id) async{
    final result = await databaseHelperTv.getTvById(id);
    if (result != null) {
      return TvSeriesTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<String> removeWatchlistTv(TvSeriesTable tvSeriesTable) async{
    try {
      await databaseHelperTv.removeWatchListTv(tvSeriesTable);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

}