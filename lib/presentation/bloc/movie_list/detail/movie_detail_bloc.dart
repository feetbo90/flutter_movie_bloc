import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'movie_detail_state.dart';
part 'movie_detail_event.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail _getDetailMovies;

  MovieDetailBloc(this._getDetailMovies) : super(MovieDetailEmpty()) {
    on<OnMovieDetail>((event, emit) async {
      final id = event.id;

      emit(MovieDetailLoading());
      final result = await _getDetailMovies.execute(id);

      result.fold(
            (failure) {emit(MovieDetailError(failure.message));},
            (data) {
          emit(MovieDetailHasData(data));
        },
      );
    },
    );
  }

}