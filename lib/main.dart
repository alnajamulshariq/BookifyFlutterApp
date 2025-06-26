import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:bookify/screens/cart.dart';
import 'package:bookify/screens/catalog.dart';
import 'package:bookify/screens/categories/action_page.dart';
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
import 'package:bookify/screens/admin/screens/dashboard.dart'; // Import Dashboard for Admin
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bookify/utils/themes/themes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore to fetch user role

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: 'https://gnuysoelfiqurqlhcmrt.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdudXlzb2VsZmlxdXJxbGhjbXJ0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTA3NjkzMzAsImV4cCI6MjA2NjM0NTMzMH0.PT_UHlxC_yXfHwiT6v5MXYZaf34EGvcZ3POC6vNlGxk',
  );
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
        '/action': (context) => ActionPage(),
      },
      home: FutureBuilder(
        future: _checkUserRole(), // Check role when the app starts
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen(); // Show splash screen while checking
          } else if (snapshot.hasError) {
            return SplashScreen(); // Show splash screen in case of error
          } else {
            String? role = snapshot.data;

            // Navigate to Dashboard if Admin, else HomeScreen if User
            if (role == "Admin") {
              return const Dashboard(); // Admin dashboard
            } else if (role == "User") {
              return const HomeScreen(); // User home screen
            } else {
              return SplashScreen(); // Show splash screen if no role or not logged in
            }
          }
        },
      ),
    );
  }

  // Function to check the user's role
  Future<String?> _checkUserRole() async {
    fb_auth.User? user = fb_auth.FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        return userDoc['role'];
      }
    }

    return null;
  }
}
