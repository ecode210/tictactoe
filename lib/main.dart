import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/view/main_menu.dart';
import 'package:tictactoe/viewmodel/tictactoe_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: () {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: TicTacToeProvider(),
            ),
          ],
          builder: (context, child) {
            return MaterialApp(
              title: "TicTacToe",
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme: TextTheme(
                  headline1: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.black.withOpacity(0.1),
                      fontSize: 200.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  button: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.purple.shade900,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              home: const MainMenu(),
            );
          },
        );
      },
    );
  }
}
