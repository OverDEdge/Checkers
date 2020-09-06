import 'package:flutter/material.dart';

import 'tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int numberOfSquares = 64, squaresInRow = 8;
  List<int> player1Tiles = [1, 3, 5, 7, 8, 10, 12, 14, 17, 19, 21, 23];
  List<int> player2Tiles = [40, 42, 44, 46, 49, 51, 53, 55, 56, 58, 60, 62];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Checkers'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: GridView.builder(
                      //physics: NeverScrollableScrollPhysics(),
                      itemCount: numberOfSquares,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: squaresInRow,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        if ((index + (index / squaresInRow).floor()) % 2 == 0) {
                          return MyTile(
                            color: Colors.white,
                          );
                        } else if (player1Tiles.contains(index)) {
                          return MyTile(
                            color: Colors.red,
                            image: DecorationImage(
                              image: AssetImage('lib/images/tile2.png'),
                              fit: BoxFit.fill,
                            ),
                          );
                        } else if (player2Tiles.contains(index)) {
                          return MyTile(
                            color: Colors.red,
                            image: DecorationImage(
                              image: AssetImage('lib/images/tile1.png'),
                              fit: BoxFit.fill,
                            ),
                          );
                        } else {
                          return MyTile(
                            color: Colors.red,
                          );
                        }
                      }),
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
