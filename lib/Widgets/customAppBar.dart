import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final double scollOffset;
  const CustomAppBar({Key? key, this.scollOffset = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      color:
          Colors.black.withOpacity((scollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          children: [
            Image(image: AssetImage('assets/icons/movies12.png')),
            SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _AppBarButton(
                    onTap: () {},
                    title: 'Tv Shows',
                  ),
                  _AppBarButton(
                    onTap: () {},
                    title: 'Movies',
                  ),
                  _AppBarButton(
                    onTap: () {},
                    title: 'My List',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;

  _AppBarButton({required this.title, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600),
      ),
    );
  }
}
