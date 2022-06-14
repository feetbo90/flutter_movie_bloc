import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/tv_series/tv_detail.dart';
import 'package:ditonton/presentation/bloc/tv_series/detail/tv_detail_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_recommendations/tv_recommendation_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series/watchlist/tv_watchlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TvDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail_tv';

  final int id;

  TvDetailPage({required this.id});

  @override
  _TvDetailPageState createState() => _TvDetailPageState();
}

class _TvDetailPageState extends State<TvDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TvDetailBloc>().add(OnTvDetail(widget.id));
      context.read<TvRecommendationBloc>().add(OnTvRecommendation(widget.id));
      context.read<TvWatchlistBloc>().add(TvWatchListStatus(widget.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    final isTvAddedToWatchList =
    context.select<TvWatchlistBloc, bool>((bloc) {
      return (bloc.state is TvWatchListIsAdded) ? (bloc.state as TvWatchListIsAdded).isAdded : false;
    });
    return Scaffold(body: BlocBuilder<TvDetailBloc, TvDetailState>(
      builder: (context, state) {
        if (state is TvDetailLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TvDetailHasData) {
          final tvDetail = state.result;
          return DetailContent(tvDetail: tvDetail, isAddedWatchlist: isTvAddedToWatchList);
        } else {
          return const Center(
            child: Text("Periksa Koneksi Internet"),
          );
        }
      },
    ));
  }
}

class DetailContent extends StatefulWidget {
  final TvDetail tvDetail;
  bool isAddedWatchlist;
  DetailContent({
    Key? key,
    required this.tvDetail,
    required this.isAddedWatchlist,
  }) : super(key: key);
  @override
  State<DetailContent> createState() => _DetailContentState();
}

class _DetailContentState extends State<DetailContent> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${widget.tvDetail.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.tvDetail.name,
                              style: kHeading5,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                var isAddStatus = widget.isAddedWatchlist;
                                if (!widget.isAddedWatchlist) {
                                  context
                                      .read<TvWatchlistBloc>()
                                      .add(TvWatchListAdd(widget.tvDetail));
                                } else {
                                  context
                                      .read<TvWatchlistBloc>()
                                      .add(TvWatchListAdd(widget.tvDetail));
                                }

                                final state = BlocProvider.of<TvWatchlistBloc>(context).state;
                                String message = "";


                                if (state is TvWatchListIsAdded) {
                                  final isAdded = state.isAdded;
                                  isAddStatus = isAdded == false ? true : false;
                                  message = isAdded == false ? TvWatchlistBloc.watchlistAddSuccessMessage : TvWatchlistBloc.watchlistRemoveSuccessMessage;
                                } else {
                                  isAddStatus = !widget.isAddedWatchlist ? true: false;
                                  message = !widget.isAddedWatchlist ? TvWatchlistBloc.watchlistAddSuccessMessage : TvWatchlistBloc.watchlistRemoveSuccessMessage;
                                }

                                if (message == TvWatchlistBloc.watchlistAddSuccessMessage || message == TvWatchlistBloc.watchlistRemoveSuccessMessage) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(content: Text(message)));
                                }
                                else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Text(message),
                                        );
                                      });
                                }
                                setState(() {
                                  widget.isAddedWatchlist = isAddStatus;
                                });
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [  widget.isAddedWatchlist
                                    ? Icon(Icons.check)
                                    : Icon(Icons.add),
                                  Text('Watchlist'),
                                ],
                              ),
                            ),
                            Text(
                              _showGenres(widget.tvDetail.genres),
                            ),
                            // Text(
                            //   _showDuration(widget.tvDetail.status),
                            // ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: widget.tvDetail.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${widget.tvDetail.voteAverage}')
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              widget.tvDetail.overview,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            BlocBuilder<TvRecommendationBloc,
                                TvRecommendationState>(
                              builder: (context, state) {
                                if (state is TvRecommendationLoading) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is TvRecommendationEmpty) {
                                  return Text("Empty Data");
                                } else if (state is TvRecommendationHasData) {
                                  final tvRecommendation = state.result;
                                  return Container(
                                    height: 150,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final movie =
                                            tvRecommendation[index];
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                context,
                                                TvDetailPage.ROUTE_NAME,
                                                arguments: movie.id,
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                                placeholder: (context, url) =>
                                                    Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: tvRecommendation.length,
                                    ),
                                  );
                                } else {
                                  return Text("Failed");
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            // initialChildSize: 0.5,
            minChildSize: 0.25,
            // maxChildSize: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += genre.name + ', ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
