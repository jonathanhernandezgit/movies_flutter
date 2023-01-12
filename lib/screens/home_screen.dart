import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:movies_flutter/providers/movies_provider.dart';
import 'package:movies_flutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            //Slider de peliculas
            MovieSlider(
              movies: moviesProvider.popularMovies,
              populars: 'Lo nuevo',
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),

            //Listado Horizontal de Películas
          ],
        ),
      ),
    );
  }
}
