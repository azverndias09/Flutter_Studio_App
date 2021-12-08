import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gram_clone/pages/cart_page.dart';
import 'package:gram_clone/pages/home_page.dart';
import 'package:gram_clone/pages/login_page.dart';
import 'package:gram_clone/pages/widgets/themes.dart';
import 'package:gram_clone/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
