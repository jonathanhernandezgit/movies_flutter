import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:movies_flutter/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            CardSwiper(),
            //Slider de peliculas
            MovieSlider(),

            //Listado Horizontal de Películas
          ],
        ),
      ),
    );
  }
}
