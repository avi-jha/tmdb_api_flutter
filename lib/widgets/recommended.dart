import 'package:flutter/material.dart';
import 'package:movie_app_flutter/widgets/toprated.dart';
import 'package:tmdb_api/tmdb_api.dart';

class RecommendedMovies extends StatefulWidget {
  const RecommendedMovies({Key key}) : super(key: key);

  @override
  _RecommendedMoviesState createState() => _RecommendedMoviesState();
}

class _RecommendedMoviesState extends State<RecommendedMovies> {

  final String apikey = '67af5e631dcbb4d0981b06996fcd47bc';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2N2FmNWU2MzFkY2JiNGQwOTgxYjA2OTk2ZmNkNDdiYyIsInN1YiI6IjYwNzQ1OTA0ZjkyNTMyMDAyOTFmZDczYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.C_Bkz_T8OybTGo3HfYsESNjN46LBYdw3LHdF-1TzYYs';

  List topratedmovies = [];

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();


    setState(() {
      topratedmovies = topratedresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recommended Movies'
        ),
      ),
      body: ListView(
        children: [
          TopRatedMovies(
            toprated: topratedmovies,
          ),
        ],
      ),
    );
  }
}
