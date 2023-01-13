import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:movies_flutter/models/models.dart';
import 'package:movies_flutter/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(
          movieFullBackDrop: movie.fullBackdropPath,
          movieTitle: movie.title,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          _PosterAndTitle(
            moviePoster: movie.fullPosterImg,
            movieTitle: movie.title,
            movieOriginalTitle: movie.originalTitle,
            movieVoteAverage: movie.voteAverage,
          ),
          _OverView(movieOverview: movie.overview),
          CastingCards(
            movieId: movie.id,
          )
        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  final String movieTitle;
  final String movieFullBackDrop;

  const _CustomAppBar(
      {super.key, required this.movieTitle, required this.movieFullBackDrop});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          color: Colors.black12,
          child: Text(
            movieTitle,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(movieFullBackDrop),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final String moviePoster;
  final String movieTitle;
  final String movieOriginalTitle;
  final double movieVoteAverage;

  const _PosterAndTitle(
      {super.key,
      required this.movieOriginalTitle,
      required this.movieVoteAverage,
      required this.movieTitle,
      required this.moviePoster});
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(moviePoster),
                height: 150,
              ),
            ),
            SizedBox(width: 20),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width - 190),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieTitle,
                    style: textTheme.headline5,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    movieOriginalTitle,
                    style: textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star_outline, size: 15, color: Colors.grey),
                      SizedBox(width: 5),
                      Text('$movieVoteAverage /10', style: textTheme.caption)
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class _OverView extends StatelessWidget {
  final String movieOverview;

  const _OverView({super.key, required this.movieOverview});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        movieOverview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
