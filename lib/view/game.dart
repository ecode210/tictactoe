import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tictactoe/view/widgets/game_board.dart';
import 'package:tictactoe/view/widgets/score_board.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade900,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: 640.h,
            width: 360.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50.h),
                const ScoreBoard(),
                SizedBox(height: 30.h),
                const Expanded(child: GameBoard()),
              ],
            ),
          ),
          Positioned(
            bottom: -150,
            left: -80,
            child: Text(
              "X",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Positioned(
            bottom: -150,
            right: -80,
            child: Text(
              "O",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ],
      ),
    );
  }
}
