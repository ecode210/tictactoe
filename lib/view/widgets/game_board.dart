import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/viewmodel/tictactoe_provider.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Provider.of<TicTacToeProvider>(context, listen: false).play(index: index);
            },
            child: Consumer<TicTacToeProvider>(
              builder: (context, ttc, child) {
                return Container(
                  margin: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: ttc.gameBoardCells[index] == "" ? 0 : 150,
                    height: ttc.gameBoardCells[index] == "" ? 0 : 150,
                    alignment: Alignment.center,
                    child: Text(
                      ttc.gameBoardCells[index],
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
