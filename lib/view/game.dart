import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/view/widgets/game_board.dart';
import 'package:tictactoe/view/widgets/score_board.dart';
import 'package:tictactoe/viewmodel/tictactoe_provider.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade900,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 640.h,
            width: 360.w,
            padding: EdgeInsets.symmetric(vertical: 50.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ScoreBoard(),
                SizedBox(height: 40.h),
                const Expanded(child: GameBoard()),
                BouncingWidget(
                  onPressed: () {
                    Provider.of<TicTacToeProvider>(context, listen: false).startOver();
                  },
                  scaleFactor: 2,
                  child: Container(
                    height: 40.h,
                    width: 170.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Start Over",
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Lottie.asset(
              "assets/lottie/fireworks.json",
              width: 360.w,
              fit: BoxFit.fitWidth,
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
