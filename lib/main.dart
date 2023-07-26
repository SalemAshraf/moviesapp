// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/Pages/HomeScreen.dart';

import 'Pages/moviesDetailsScreen.dart';
import 'Pages/navScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: prefer_const_constructors
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Netflix UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        // ignore: prefer_const_constructors
        HomeScreen.routeName : (context) => HomeScreen( ),
      },
      home: NavScreen(),
    );
  }
}
