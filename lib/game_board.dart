import 'package:flutter/material.dart';

import 'tile.dart';

class GameBoard extends StatefulWidget {
  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  final int numberOfSquares = 64, squaresInRow = 8;
  List<int> player1Tiles = [1, 3, 5, 7, 8, 10, 12, 14, 17, 19, 21, 23];
  List<int> player1Kings = [];
  List<int> player2Tiles = [40, 42, 44, 46, 49, 51, 53, 55, 56, 58, 60, 62];
  List<int> player2Kings = [];
  List<int> possibleMoves = [];

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
                        Color color;
                        Widget tile;
                        Widget child;

                        // Set board color
                        if ((index + (index / squaresInRow).floor()) % 2 == 0) {
                          color = Colors.white;
                        } else {
                          color = Colors.red;
                        }

                        // Set pieces
                        if (player1Kings.contains(index)) {
                          tile = Image.asset('lib/images/king1.png');
                        } else if (player1Tiles.contains(index)) {
                          tile = Image.asset('lib/images/tile1.png');
                        } else if (player2Kings.contains(index)) {
                          tile = Image.asset('lib/images/king2.png');
                        } else if (player2Tiles.contains(index)) {
                          tile = Image.asset('lib/images/tile2.png');
                        }

                        if (tile != null) {
                          child = FittedBox(
                            child: tile,
                            fit: BoxFit.fill,
                          );
                        }

                        return MyTile(
                          color: color,
                          child: child,
                        );
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
