import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/viewmodel/tictactoe_provider.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Consumer<TicTacToeProvider>(
        builder: (context, ttc, child) {
          return Row(
            children: [
              Container(
                height: 40.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    bottomLeft: Radius.circular(50.r),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Player X",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  border: Border.all(
                    color: Colors.black.withOpacity(0.2),
                    width: 4.w,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  ttc.playerXScore.toString(),
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              const Spacer(),
              Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  border: Border.all(
                    color: Colors.black.withOpacity(0.2),
                    width: 4.w,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  ttc.playerOScore.toString(),
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Container(
                height: 40.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50.r),
                    bottomRight: Radius.circular(50.r),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Player O",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
