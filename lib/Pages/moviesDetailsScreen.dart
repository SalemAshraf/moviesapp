// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors_in_immutables, unused_local_variable, prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables, non_constant_identifier_names, prefer_if_null_operators, unnecessary_null_comparison, avoid_unnecessary_containers
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:movies/Widgets/TextWidget.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = 'MovieDetailsScreen';

  final String name, description, bannerurl, posterurl, vote, launch_on;
  MovieDetailsScreen({
    Key? key,
    required this.launch_on,
    required this.name,
    required this.description,
    required this.bannerurl,
    required this.posterurl,
    required this.vote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Movie Details'),
        ),
        backgroundColor: Colors.black,
        body: Container(
            child: ListView(children: [
          //Title
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: TextWidget(
                  text: name != null ? name : 'Not Loaded',
                  color: Colors.white,
                  fontSize: 30)),
          //Date
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              child: TextWidget(
                  text: 'Releasing on ' + launch_on,
                  color: Colors.white38,
                  fontSize: 16)),
          // cover
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              bannerurl,
              fit: BoxFit.cover,
            ),
          ),
          // Row Afteer Cover
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Image.network(posterurl),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                      child: TextWidget(
                          text: '⭐ Average Rating : ' + vote + ' / 10',
                          color: Colors.white,
                          fontSize: 12)),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.6,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                      child: TextWidget(
                          text: description,
                          color: Colors.white,
                          fontSize: 14)),
                ],
              )
            ],
          )
        ])));
  }
}
