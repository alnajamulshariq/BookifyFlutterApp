import 'package:bookify/screens/cart.dart';
import 'package:bookify/screens/catalog.dart';
import 'package:bookify/screens/home.dart';
import 'package:bookify/screens/profile.dart';
import 'package:bookify/screens/splashscreen.dart';
import 'package:bookify/screens/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:bookify/utils/themes/themes.dart';

void main() {
  runApp(const FlutterApp());
}

class FlutterApp extends StatelessWidget {
  const FlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookify',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      routes: {
        '/home': (context) => HomeScreen(),
        '/catalog': (context) => CatalogScreen(),
        '/cart': (context) => CartScreen(),
        '/wishlist': (context) => WishListScreen(),
        '/profile': (context) => ProfileScreen(),
      },
      home: HomeScreen(),
    );
  }
}
