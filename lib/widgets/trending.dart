import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:movie_app_flutter/utils/text.dart';

import '../description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key key, this.trending}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Trending Movies',
            size: 26,
          ),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trending.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Description(
                                        name: trending[index]['title'],
                                        bannerurl:
                                            'https://image.tmdb.org/t/p/w500' +
                                                trending[index]
                                                    ['backdrop_path'],
                                        posterurl:
                                            'https://image.tmdb.org/t/p/w500' +
                                                trending[index]['poster_path'],
                                        description: trending[index]
                                            ['overview'],
                                        vote: trending[index]['vote_average']
                                            .toString(),
                                        launch_on: trending[index]
                                            ['release_date'],
                                      )));
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: 140,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w500' +
                                                trending[index]['poster_path']),
                                      ),
                                    ),
                                    height: 195,
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    child: modified_text(
                                        size: 15,
                                        text: trending[index]['title'] != null
                                            ? trending[index]['title']
                                            : 'Loading'),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              right: 2,
                              bottom: -4,
                              child: LikeButton(
                                size: 50,
                                circleColor:
                                CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                                bubblesColor: BubblesColor(
                                  dotPrimaryColor: Color(0xff33b5e5),
                                  dotSecondaryColor: Color(0xff0099cc),
                                ),
                                likeBuilder: (bool isLiked) {
                                  return Icon(
                                    Icons.favorite_rounded,
                                    color: isLiked ? Colors.blue : Colors.white70,
                                    size: 25,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
