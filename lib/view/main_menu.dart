import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictactoe/view/game.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

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
                SvgPicture.asset(
                  "assets/svg/ttc.svg",
                  height: 150.h,
                  width: 150.w,
                  fit: BoxFit.contain,
                  placeholderBuilder: (context) {
                    return Container(
                      height: 150.h,
                      width: 150.w,
                      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 52.h),
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        backgroundColor: Colors.black.withOpacity(0.1),
                        strokeWidth: 5.w,
                      ),
                    );
                  },
                ),
                SizedBox(height: 50.h),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Game(),
                      ),
                    );
                  },
                  child: Container(
                    height: 40.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Play Game",
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -120,
            left: -50,
            child: Text(
              "X",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Positioned(
            bottom: -120,
            right: -50,
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
