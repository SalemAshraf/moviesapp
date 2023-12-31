import 'package:flutter/material.dart';

class VerticalIconButton extends StatelessWidget {
  const VerticalIconButton({Key? key, required this.onTap, required this.icon, required this.title}) : super(key: key);
  final Function onTap;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Column(
        children: [
          Icon(icon, color: Colors.white,),
          const SizedBox(height: 2.0,),
          Text(title,style: TextStyle(color: Colors.white , fontWeight: FontWeight.w600),)
        ],
      ),
    );
  }
}
