import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/presentation/bloc/movie_list/watchlist/movie_watchlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistButton extends StatelessWidget {
  final MovieDetail contentData;

  WatchlistButton(this.contentData);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieWatchlistBloc, MovieWatchlistState>(
      // builder: (context, state) {
      //   if (state is MovieWatchListMessage) {
      //     ScaffoldMessenger.of(context)
      //         .showSnackBar(SnackBar(content: Text(state.message)));
      //   } else if (state is MovieWatchlistError) {
      //     showDialog(
      //         context: context,
      //         builder: (context) {
      //           return AlertDialog(
      //               content: Text(
      //             state.message,
      //           ));
      //         });
      //   }
      // },
      builder: (BuildContext context, state) {

        return ElevatedButton(
          onPressed: () async {
            if (state is MovieWatchListIsAdded) {
              context.read<MovieWatchlistBloc>().add(state.isAdded
                  ? MovieWatchListRemove(contentData)
                  : MovieWatchListAdd(contentData));
            } else if(state is MovieWatchListIsAdded){
              context.read<MovieWatchlistBloc>().add(state.isAdded
                  ? MovieWatchListAdd(contentData)
                  : MovieWatchListRemove(contentData));
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (state is MovieWatchListIsAdded)
                state.isAdded ? Icon(Icons.check) : Icon(Icons.add),
              Text('Watchlist'),
            ],
          ),
        );
      },
    );
  }
}
