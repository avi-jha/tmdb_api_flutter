import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:movie_app_flutter/utils/text.dart';
import 'package:http/http.dart' as http;

Future<Album> createAlbum(String title) async {
  final http.Response response = await http.post(
    Uri.parse(
      'http://localhost:9001/movie',
    ),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class Album {
  final int id;
  final String title;

  Album({this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}

class TV extends StatelessWidget {
  final List tv;

  const TV({Key key, this.tv}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Popular TV Shows',
            size: 26,
          ),
          SizedBox(height: 10),
          Container(
            // color: Colors.red,
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 12,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    // color: Colors.green,
                    width: 250,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            tv[index]['backdrop_path']),
                                    fit: BoxFit.cover),
                              ),
                              height: 140,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: modified_text(
                                  size: 15,
                                  text: tv[index]['original_name'] != null
                                      ? tv[index]['original_name']
                                      : 'Loading'),
                            )
                          ],
                        ),
                        Positioned(
                          right: 2,
                          bottom: -4,
                          child: LikeButton(
                            size: 50,
                            circleColor: CircleColor(
                                start: Color(0xff00ddff),
                                end: Color(0xff0099cc)),
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
