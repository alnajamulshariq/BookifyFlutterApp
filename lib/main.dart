// import 'package:bookify/screens/cart.dart';
// import 'package:bookify/screens/catalog.dart';
// import 'package:bookify/screens/categories/action_page.dart';
// import 'package:bookify/screens/categories/fantasy_page.dart';
// import 'package:bookify/screens/categories/history_page.dart';
// import 'package:bookify/screens/categories/novels_page.dart';
// import 'package:bookify/screens/categories/poetry_page.dart';
// import 'package:bookify/screens/categories/romance_page.dart';
// import 'package:bookify/screens/categories/science_page.dart';
// import 'package:bookify/screens/categories/self_love_page.dart';
// import 'package:bookify/screens/home.dart';
// import 'package:bookify/screens/profile.dart';
// import 'package:bookify/screens/splashscreen.dart';
// import 'package:bookify/screens/wishlist.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:bookify/utils/themes/themes.dart';
// import 'firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(const FlutterApp());
// }

// class FlutterApp extends StatelessWidget {
//   const FlutterApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Bookify',
//       debugShowCheckedModeBanner: false,
//       themeMode: ThemeMode.system,
//       theme: MyTheme.lightTheme,
//       darkTheme: MyTheme.darkTheme,
//       initialRoute: '/',
//       routes: {
//         '/home': (context) => HomeScreen(),
//         '/catalog': (context) => CatalogScreen(),
//         '/cart': (context) => CartScreen(),
//         '/wishlist': (context) => WishListScreen(),
//         '/profile': (context) => ProfileScreen(),
//         '/novels': (context) => NovelsPage(),
//         '/self-love': (context) => SelfLovePage(),
//         '/science': (context) => SciencePage(),
//         '/romance': (context) => RomancePage(),
//         '/history': (context) => HistoryPage(),
//         '/fantasy': (context) => FantasyPage(),
//         '/poetry': (context) => PoetryPage(),
//         '/action': (context) => ActionPage(),
//       },
//       home: SplashScreen(),
//     );
//   }
// }

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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookify/utils/themes/themes.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore to fetch user role

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
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Fetch user data from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        // Return the role from Firestore
        return userDoc['role'];
      }
    }

    return null; // If no user is logged in or role not found
  }
}
