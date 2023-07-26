import 'package:flutter/material.dart';
import 'package:movies/Widgets/VerticalIconButton.dart';


class ContentHeader extends StatelessWidget {
  ContentHeader({Key? key, required this.header}) : super(key: key);
  final List header;
  @override
  Widget build(BuildContext context) {
    if (header.isEmpty) {
      return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: CircularProgressIndicator(
        backgroundColor: Colors.red[200],
        color: Colors.red,
      ),
          ));
    }
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 550.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('http://image.tmdb.org/t/p/w500' +
                      header[12]['poster_path']),
                  fit: BoxFit.cover)),
        ),
        Container(
            height: 550.0,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter))),
        // Positioned(
        //     bottom: 110,
        //     child: SizedBox(
        //         width: 250, child: Text(popularMovies[0]['original_title']))),
        Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalIconButton(
                    onTap: () {}, icon: Icons.add, title: 'List'),
                _PlayButton(),
                VerticalIconButton(
                    onTap: () {}, icon: Icons.info_outlined, title: 'info'),
              ],
            ))
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(
          color: Colors.black,
          Icons.play_arrow,
          size: 30.0,
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.fromLTRB(15, 5, 20, 5)),
        label: const Text(
          'Play',
          style: TextStyle(
              color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w600),
        ));
  }
}
