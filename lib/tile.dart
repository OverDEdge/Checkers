import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  final DecorationImage image;
  final Color color;

  MyTile({@required this.color, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          decoration: BoxDecoration(
            image: image,
            color: color,
          ),
        ),
      ),
    );
  }
}
