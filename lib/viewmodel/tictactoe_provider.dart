import 'dart:async';

import 'package:flutter/cupertino.dart';

class TicTacToeProvider extends ChangeNotifier {
  // Determines which player's turn it is to play
  bool playerTurn = true;
  // All available cells
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
  // Player X and O score respectively
  int playerOScore = 0;
  int playerXScore = 0;
  // Cells that are filled
  int occupiedCells = 0;
  // Toggles animation for win
  bool winningAnimation = false;

  // Allows player to make a move and detect if there's a winner
  void play({required int index}) {
    // Alternate player's turn
    playerTurn = !playerTurn;

    // Detects whether it's Player X's turn or Player O's turn
    if (gameBoardCells[index] == "" && playerTurn) {
      gameBoardCells[index] = "O";
      occupiedCells++;
    } else if (gameBoardCells[index] == "" && !playerTurn) {
      gameBoardCells[index] = "X";
      occupiedCells++;
    }

    checkGameOver();
    notifyListeners();
  }

  // Clear the score and start the game over
  void startOver() {
    // Iterates through all cells and resets it
    for (int i = 0; i < 9; i++) {
      gameBoardCells[i] = "";
    }
    // Resets all player data
    playerXScore = 0;
    playerOScore = 0;
    occupiedCells = 0;
    notifyListeners();
  }

  // Restarts the game after a win or draw
  void playAgain({required String winningCell}) {
    // Increment player score and play winning animation
    switch (winningCell) {
      case "X":
        playerXScore++;
        winningAnimation = true;
        notifyListeners();
        break;
      case "O":
        playerOScore++;
        winningAnimation = true;
        notifyListeners();
        break;
    }

    // Resets game board after 2 second delay
    Timer(
      const Duration(seconds: 2),
      () {
        for (int i = 0; i < 9; i++) {
          gameBoardCells[i] = "";
        }
        winningAnimation = false;
        occupiedCells = 0;
        notifyListeners();
      },
    );
  }

  // Checks all possible outcomes for a win or draw
  void checkGameOver() {
    // Checking if there's a win on the rows
    if (gameBoardCells[0] == gameBoardCells[1] && gameBoardCells[0] == gameBoardCells[2] && gameBoardCells[0] != '') {
      playAgain(winningCell: gameBoardCells[0]);
    }
    if (gameBoardCells[3] == gameBoardCells[4] && gameBoardCells[3] == gameBoardCells[5] && gameBoardCells[3] != '') {
      playAgain(winningCell: gameBoardCells[3]);
    }
    if (gameBoardCells[6] == gameBoardCells[7] && gameBoardCells[6] == gameBoardCells[8] && gameBoardCells[6] != '') {
      playAgain(winningCell: gameBoardCells[6]);
    }

    // Checking if there's a win on the columns
    if (gameBoardCells[0] == gameBoardCells[3] && gameBoardCells[0] == gameBoardCells[6] && gameBoardCells[0] != '') {
      playAgain(winningCell: gameBoardCells[0]);
    }
    if (gameBoardCells[1] == gameBoardCells[4] && gameBoardCells[1] == gameBoardCells[7] && gameBoardCells[1] != '') {
      playAgain(winningCell: gameBoardCells[1]);
    }
    if (gameBoardCells[2] == gameBoardCells[5] && gameBoardCells[2] == gameBoardCells[8] && gameBoardCells[2] != '') {
      playAgain(winningCell: gameBoardCells[2]);
    }

    // Checking if there's a win diagonally
    if (gameBoardCells[0] == gameBoardCells[4] && gameBoardCells[0] == gameBoardCells[8] && gameBoardCells[0] != '') {
      playAgain(winningCell: gameBoardCells[0]);
    }
    if (gameBoardCells[2] == gameBoardCells[4] && gameBoardCells[2] == gameBoardCells[6] && gameBoardCells[2] != '') {
      playAgain(winningCell: gameBoardCells[2]);
    }

    // Checking if there is a draw
    if (occupiedCells == 9) {
      playAgain(winningCell: "DRAW");
    }
  }
}
