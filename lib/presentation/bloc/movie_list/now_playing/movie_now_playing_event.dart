part of 'movie_now_playing_bloc.dart';

abstract class MovieNowPlayingEvent extends Equatable {
  const MovieNowPlayingEvent();

  @override
  List<Object> get props => [];
}

class OnMovieNowPlaying extends MovieNowPlayingEvent {
  OnMovieNowPlaying();

  @override
  List<Object> get props => [];
}