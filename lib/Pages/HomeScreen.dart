// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/Widgets/customAppBar.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'content header.dart';
import 'contentlist.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";
const HomeScreen({ Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _scrollOffset = 0.0;
  ScrollController? _scrollController;
  @override
  void initState() {
    loadmovies();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController!.offset;
        });
      });
    super.initState();
  }
  final String apikey = '8604d083b68fe27a3700d4838e35174c';

  final String readaccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4NjA0ZDA4M2I2OGZlMjdhMzcwMGQ0ODM4ZTM1MTc0YyIsInN1YiI6IjY0ODgyNzc0ZTM3NWMwMDEzOWMxYjllMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mrfajVCHvs9wm8M61c0esoKhUszghYsXUeSdOkwXGP0';

  List popularMovies = [];
  List topratedmovies = [];
  List tv = [];

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccessToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    print((trendingresult));
    setState(() {
      popularMovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 50.0),
          child: CustomAppBar(
            scollOffset: _scrollOffset,
          )),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
              child: ContentHeader(header: popularMovies,)),
          SliverPadding(
            padding: const EdgeInsets.only(top: 0.0),
            sliver: SliverToBoxAdapter(
              key: PageStorageKey('New Releases'),
              child: ContentList(title: 'New Releases', contentList: popularMovies),
            ),
          ),
          SliverToBoxAdapter(
            key: PageStorageKey('Netflix Production'),

            child: ContentList(title: 'Netflix Production' , isNetflix: true , contentList: tv),
          ),
          SliverToBoxAdapter(
            key: PageStorageKey('Trending Now'),

            child: ContentList(title: 'Trending Now', contentList: topratedmovies),
          ),
        ],
      ),
    );
  }
}
