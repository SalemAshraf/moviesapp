// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../Widgets/TextWidget.dart';
import 'HomeScreen.dart';
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

class SplashScreen extends StatelessWidget {
    static const String routeName = "SplashScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Splash Screen Background
          Image(
            image: AssetImage('assets/images/Splash.png'),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          // Splash Screen Text & Button
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextWidget(
                        text: "Unlimited movies, Tv shows & more",
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center)),
                SizedBox(
                  height: 28,
                ),
                TextWidget(
                  text: "Watch anywhere, Cancel anytime.",
                  color: Colors.white54,
                  fontSize: 14,
                ),
                // Text(
                //   "Watch anywhere, Cancel anytime.",
                //   style: TextStyle(
                //     color: Colors.white54,
                //     fontSize: 14,
                //   ),
                // ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text("GET STARTED"),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFDC2F2F),
                            elevation: 0,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, HomeScreen.routeName);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
