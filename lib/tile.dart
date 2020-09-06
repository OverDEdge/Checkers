import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  final child;
  final Color color;

  MyTile({@required this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Container(
            child: child,
            color: color,
          ),
        ),
      ),
    );
  }
}
