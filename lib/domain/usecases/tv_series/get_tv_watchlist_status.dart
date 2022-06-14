import 'package:ditonton/domain/repositories/tv_series_repository.dart';

class GetTvWatchlistStatus {
  final TvSeriesRepository repository;

  GetTvWatchlistStatus(this.repository);

  Future<bool> execute(int id) async {
    return repository.isAddedToWatchlistTv(id);
  }
}
