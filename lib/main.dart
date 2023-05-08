import 'package:flutter/material.dart';
import 'package:flutter_catalog/screens/homepage.dart';
import 'package:flutter_catalog/screens/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    int days=30;
    return MaterialApp(

      themeMode: ThemeMode.dark,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/":(context)=>LoginPage(),
        MyRoutes.homeRoute:(context)=>HomePage(),
        MyRoutes.loginRoute:(context)=>LoginPage(),
      },
      );
  }
}
