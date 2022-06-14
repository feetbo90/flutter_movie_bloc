import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/domain/entities/tv_series/tv.dart';
import 'package:ditonton/presentation/bloc/tv_series/airing_today/tv_today_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series/popular/tv_popular_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series/top_rated/tv_top_rated_bloc.dart';
import 'package:ditonton/presentation/pages/tv_series/popular_tv_page.dart';
import 'package:ditonton/presentation/pages/tv_series/search_tv_page.dart';
import 'package:ditonton/presentation/pages/tv_series/top_rated_tv_page.dart';
import 'package:ditonton/presentation/pages/tv_series/tv_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomeTvSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/home-tv_series';

  @override
  _HomeTvSeriesPageState createState() => _HomeTvSeriesPageState();
}

class _HomeTvSeriesPageState extends State<HomeTvSeriesPage> with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TvTodayBloc>().add(OnTvToday());
      context.read<TvTopRatedBloc>().add(OnTvTopRated());
      context.read<TvPopularBloc>().add(OnTvPopular());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tv Series'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchTvPage.ROUTE_NAME);
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tv Airing Today',
                style: kHeading6,
              ),
              BlocBuilder<TvTodayBloc, TvTodayState>(
                builder: (context, state) {
                  if (state is TvTodayLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TvTodayHasData) {
                    final result = state.result;
                    return TvSeriesList(result);
                  } else if (state is TvTodayError) {
                    return Expanded(
                      child: Center(
                        child: Text(state.message,style: kHeading5),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: Text("Gagal koneksi"),
                    );
                  }
                },
              ),
              _buildSubHeading(
                title: 'Tv Popular',
                onTap: () =>
                    Navigator.pushNamed(context, PopularTvPage.ROUTE_NAME),
              ),
              BlocBuilder<TvPopularBloc, TvPopularState>(
                builder: (context, state) {
                  if (state is TvPopularLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TvPopularHasData) {
                    final result = state.result;
                    return TvSeriesList(result);
                  } else if (state is TvPopularError) {
                    return Expanded(
                      child: Center(
                        child: Text(state.message,style: kHeading5),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: Text("Gagal koneksi"),
                    );
                  }
                },
              ),
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () =>
                    Navigator.pushNamed(context, TopRatedTvPage.ROUTE_NAME),
              ),
              BlocBuilder<TvTopRatedBloc, TvTopRatedState>(
                builder: (context, state) {
                  if (state is TvTopRatedLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TvTopRatedHasData) {
                    final result = state.result;
                    return TvSeriesList(result);
                  } else if (state is TvTopRatedError) {
                    return Expanded(
                      child: Center(
                        child: Text(state.message,style: kHeading5),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: Text("Gagal koneksi"),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class TvSeriesList extends StatelessWidget {
  final List<Tv> movies;

  TvSeriesList(this.movies);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TvDetailPage.ROUTE_NAME,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
