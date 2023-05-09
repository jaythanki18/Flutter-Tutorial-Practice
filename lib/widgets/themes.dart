import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context)=>ThemeData(
    primarySwatch: Colors.deepPurple,
    cardColor: Colors.white,
    canvasColor: creamColor,
    buttonColor: MyTheme.darkCreamColor,
    accentColor: MyTheme.darkBluishColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      toolbarTextStyle: Theme.of(context).textTheme.headlineSmall, titleTextStyle: Theme.of(context).textTheme.headlineSmall,
    ),
  );

  static ThemeData darkTheme(BuildContext context)=>ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    brightness: Brightness.dark,
    cardColor: Colors.black,
    canvasColor: darkCreamColor,
    buttonColor: lightBluishColor,
    accentColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),

      toolbarTextStyle: Theme.of(context).textTheme.headlineSmall, titleTextStyle: Theme.of(context).textTheme.headlineSmall,
    ),
  );

  static Color creamColor=Color(0xfff5f5f5);
  static Color darkCreamColor=Vx.gray900;
  static Color darkBluishColor=Color(0xff403b58);
  static Color lightBluishColor=Vx.indigo500;
}