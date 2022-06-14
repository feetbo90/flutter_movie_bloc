import 'package:ditonton/domain/entities/tv_series/tv.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_top_rated.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'tv_top_rated_state.dart';
part 'tv_top_rated_event.dart';

class TvTopRatedBloc extends Bloc<TvTopRatedEvent, TvTopRatedState> {
  final GetTvTopRated _getTopRatedTv;

  TvTopRatedBloc(this._getTopRatedTv) : super(TvTopRatedEmpty()) {
    on<OnTvTopRated>((event, emit) async {

      emit(TvTopRatedLoading());
      final result = await _getTopRatedTv.execute();

      result.fold(
            (failure) {emit(TvTopRatedError(failure.message));},
            (data) {
          emit(TvTopRatedHasData(data));
        },
      );
    },
    );
  }

}