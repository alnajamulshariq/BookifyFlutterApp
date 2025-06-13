import 'package:bookify/screens/cart.dart';
import 'package:bookify/screens/catalog.dart';
import 'package:bookify/screens/categories/fantasy_page.dart';
import 'package:bookify/screens/categories/history_page.dart';
import 'package:bookify/screens/categories/novels_page.dart';
import 'package:bookify/screens/categories/poetry_page.dart';
import 'package:bookify/screens/categories/romance_page.dart';
import 'package:bookify/screens/categories/science_page.dart';
import 'package:bookify/screens/categories/self_love_page.dart';
import 'package:bookify/screens/home.dart';
import 'package:bookify/screens/profile.dart';
import 'package:bookify/screens/splashscreen.dart';
import 'package:bookify/screens/wishlist.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bookify/utils/themes/themes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      initialRoute: '/',
      routes: {
        '/home': (context) => HomeScreen(),
        '/catalog': (context) => CatalogScreen(),
        '/cart': (context) => CartScreen(),
        '/wishlist': (context) => WishListScreen(),
        '/profile': (context) => ProfileScreen(),
        '/novels': (context) => NovelsPage(),
        '/self-love': (context) => SelfLovePage(),
        '/science': (context) => SciencePage(),
        '/romance': (context) => RomancePage(),
        '/history': (context) => HistoryPage(),
        '/fantasy': (context) => FantasyPage(),
        '/poetry': (context) => PoetryPage(),
      },
      home: SplashScreen(),
    );
  }
}
