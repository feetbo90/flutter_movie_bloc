import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/get_now_playing_movies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'movie_now_playing_state.dart';
part 'movie_now_playing_event.dart';

class MovieNowPlayingBloc extends Bloc<MovieNowPlayingEvent, MovieNowPlayingState> {
  final GetNowPlayingMovies _getNowPlayingMovies;

  MovieNowPlayingBloc(this._getNowPlayingMovies) : super(MovieNowPlayingEmpty()) {
    on<OnMovieNowPlaying>((event, emit) async {

      emit(MovieNowPlayingLoading());
      final result = await _getNowPlayingMovies.execute();

      result.fold(
            (failure) {emit(MovieNowPlayingError(failure.message));},
            (data) {
          emit(MovieNowPlayingHasData(data));
        },
      );
    },
    );
  }

}