import 'package:flutter/material.dart';
import 'package:movie_app/componenets/movie_card.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/pages/movie_datails.dart';
import 'package:movie_app/providers/movie_provier.dart';
import 'package:provider/provider.dart';
import 'dart:js' as js;

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MovieProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Listing',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 2, 2, 2)),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  //its called before this object is added to the tree
  void initState() {
    Provider.of<MovieProvider>(context, listen: false).loadMovies(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movieData = Provider.of<MovieProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Movie",
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: ListView.builder(
              itemCount: movieData.movieList.length,
              itemBuilder: (context, index) {
                final movie = movieData.movieList[index];
                return MovieCard(movie: movie);
              }),
        ));
  }
}
