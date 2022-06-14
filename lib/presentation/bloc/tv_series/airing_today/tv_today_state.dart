part of 'tv_today_bloc.dart';

abstract class TvTodayState extends Equatable {
  const TvTodayState();

  @override
  List<Object> get props => [];
}

class TvTodayEmpty extends TvTodayState {}

class TvTodayLoading extends TvTodayState {}

class TvTodayError extends TvTodayState {
  final String message;

  TvTodayError(this.message);

  @override
  List<Object> get props => [message];
}

class TvTodayHasData extends TvTodayState {
  final List<Tv> result;

  TvTodayHasData(this.result);

  @override
  List<Object> get props => [result];
}