import 'package:flutter/material.dart';
import 'package:movie_app_flutter/utils/text.dart';
import 'package:movie_app_flutter/widgets/recommended.dart';
import 'package:movie_app_flutter/widgets/trending.dart';
import 'package:movie_app_flutter/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apikey = '67af5e631dcbb4d0981b06996fcd47bc';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2N2FmNWU2MzFkY2JiNGQwOTgxYjA2OTk2ZmNkNDdiYyIsInN1YiI6IjYwNzQ1OTA0ZjkyNTMyMDAyOTFmZDczYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.C_Bkz_T8OybTGo3HfYsESNjN46LBYdw3LHdF-1TzYYs';
  List trendingmovies = [];
  List tv = [];

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

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    print((trendingresult));
    setState(() {
      trendingmovies = trendingresult['results'];
      tv = tvresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        mini: false,
        backgroundColor: Colors.black,
        splashColor: Colors.black,
        hoverElevation: 1.5,
        shape: StadiumBorder(
          side: BorderSide(
            color: Colors.blue,
            width: 4,
          ),
        ),
        elevation: 1.5,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecommendedMovies(),
            ),
          );
        },
        child: const FittedBox(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: modified_text(text: 'Click on ❤️'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          TV(tv: tv),
          TrendingMovies(
            trending: trendingmovies,
          ),
        ],
      ),
    );
  }
}
