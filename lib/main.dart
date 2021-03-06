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
    // Added Custom screen size for adaptive widgets
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: () {
        // Injected TicTacToeProvider into the widget tree
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
                  headline3: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  headline4: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
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
