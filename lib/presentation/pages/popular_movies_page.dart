import 'package:ditonton/presentation/bloc/movie_list/now_playing/movie_now_playing_bloc.dart';
import 'package:ditonton/presentation/bloc/movie_list/popular/movie_popular_bloc.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class PopularMoviesPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-movie';

  @override
  _PopularMoviesPageState createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  @override
  void initState() {
    Future.microtask(() =>
        context.read<MoviePopularBloc>().add(OnMoviePopular()));
        super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<MovieNowPlayingBloc, MovieNowPlayingState>(
          builder: (context, state) {
            if (state is MovieNowPlayingLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MovieNowPlayingHasData) {
              final result = state.result;
              return ListView.builder(
                  itemCount: result.length,
                  itemBuilder: (context, index) {
                    final movie = result[index];
                    return MovieCard(movie);
                  });
            } else if (state is MovieNowPlayingError) {
              return Expanded(
                child: Center(
                  child: Text(state.message),
                ),
              );
            } else {
              return Expanded(
                child: Text("Error"),
              );
            }
          },
        ),
      ),
    );
  }
}
