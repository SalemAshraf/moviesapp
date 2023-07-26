// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

import 'moviesDetailsScreen.dart';

class ContentList extends StatelessWidget {
  const ContentList(
      {Key? key,
      required this.title,
      this.isNetflix = false,
      required this.contentList})
      : super(key: key);
  final String title;
  final bool isNetflix;
  final List contentList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: isNetflix ? 500.0 : 220.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                itemCount: contentList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetailsScreen(
                                    name: contentList[index]['title'],
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            contentList[index]['backdrop_path'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            contentList[index]['poster_path'],
                                    description: contentList[index]['overview'],
                                    vote: contentList[index]['vote_average']
                                        .toString(),
                                    launch_on: contentList[index]
                                        ['release_date'],
                                  )));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      height: isNetflix ? 400.0 : 200.0,
                      width: isNetflix ? 200.0 : 130.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                'http://image.tmdb.org/t/p/w500' +
                                    contentList[index]['poster_path'],
                              ),
                              fit: BoxFit.cover)),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
