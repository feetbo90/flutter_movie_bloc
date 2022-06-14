
import 'package:ditonton/domain/entities/tv_series/tv_detail.dart';
import 'package:ditonton/domain/usecases/tv_series/get_detail_tv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'tv_detail_state.dart';
part 'tv_detail_event.dart';

class TvDetailBloc extends Bloc<TvDetailEvent, TvDetailState> {
  final GetDetailTv getDetailTv;

  TvDetailBloc(this.getDetailTv) : super(TvDetailEmpty()) {
    on<OnTvDetail>((event, emit) async {
      final id = event.id;

      emit(TvDetailLoading());
      final result = await getDetailTv.execute(id);

      result.fold(
            (failure) {emit(TvDetailError(failure.message));},
            (data) {
          emit(TvDetailHasData(data));
        },
      );
    },
    );
  }

}