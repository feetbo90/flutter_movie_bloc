import 'package:ditonton/domain/entities/tv_series/tv.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_popular.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tv_popular_state.dart';
part 'tv_popular_event.dart';

class TvPopularBloc extends Bloc<TvPopularEvent, TvPopularState> {
  final GetTvPopular _getPopularTv;

  TvPopularBloc(this._getPopularTv) : super(TvPopularEmpty()) {
    on<OnTvPopular>((event, emit) async {

      emit(TvPopularLoading());
      final result = await _getPopularTv.execute();

      result.fold(
            (failure) {
              emit(TvPopularError(failure.message));
              },
            (data) {
          emit(TvPopularHasData(data));
        },
      );
    },
    );
  }

}