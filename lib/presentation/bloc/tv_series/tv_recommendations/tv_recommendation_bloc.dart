import 'package:ditonton/domain/entities/tv_series/tv.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_recommendation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'tv_recommendation_state.dart';
part 'tv_recommendation_event.dart';

class TvRecommendationBloc extends Bloc<TvRecommendationEvent, TvRecommendationState> {
  final GetTvRecommendation _getTvRecommendations;

  TvRecommendationBloc(this._getTvRecommendations) : super(TvRecommendationEmpty()) {
    on<OnTvRecommendation>((event, emit) async {
      final id = event.id;

      emit(TvRecommendationLoading());
      final result = await _getTvRecommendations.execute(id);

      result.fold(
            (failure) {emit(TvRecommendationError(failure.message));},
            (data) {
          emit(TvRecommendationHasData(data));
        },
      );
    },
    );
  }

}