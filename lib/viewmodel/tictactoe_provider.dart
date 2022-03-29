import 'package:flutter/cupertino.dart';

class TicTacToeProvider extends ChangeNotifier {
  bool playerTurn = true;
  List<String> gameBoardCells = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  int playerOScore = 0;
  int playerXScore = 0;
  int occupiedCells = 0;

  void play({required int index}) {
    playerTurn = !playerTurn;

    if (gameBoardCells[index] == "" && playerTurn) {
      gameBoardCells[index] = "O";
      occupiedCells++;
    } else if (gameBoardCells[index] == "" && !playerTurn) {
      gameBoardCells[index] = "X";
      occupiedCells++;
    }
    notifyListeners();
  }
}
