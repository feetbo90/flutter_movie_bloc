import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/get_popular_movies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'movie_popular_state.dart';
part 'movie_popular_event.dart';

class MoviePopularBloc extends Bloc<MoviePopularEvent, MoviePopularState> {
  final GetPopularMovies _getPopularMovies;

  MoviePopularBloc(this._getPopularMovies) : super(MoviePopularEmpty()) {
    on<OnMoviePopular>((event, emit) async {

      emit(MoviePopularLoading());
      final result = await _getPopularMovies.execute();

      result.fold(
            (failure) {
              print("error disini" + failure.message);
              emit(MoviePopularError(failure.message));
              },
            (data) {
              print("berhasil disini");
          emit(MoviePopularHasData(data));
        },
      );
    },
    );
  }

}