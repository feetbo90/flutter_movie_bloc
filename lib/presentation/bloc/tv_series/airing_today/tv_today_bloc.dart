import 'package:ditonton/domain/entities/tv_series/tv.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_airing_today.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tv_today_state.dart';
part 'tv_today_event.dart';

class TvTodayBloc extends Bloc<TvTodayEvent, TvTodayState> {
  final GetTvAiringToday _getTodayTv;

  TvTodayBloc(this._getTodayTv) : super(TvTodayEmpty()) {
    on<OnTvToday>((event, emit) async {

      emit(TvTodayLoading());
      final result = await _getTodayTv.execute();

      result.fold(
            (failure) {
              emit(TvTodayError(failure.message));
              },
            (data) {
          emit(TvTodayHasData(data));
        },
      );
    },
    );
  }

}