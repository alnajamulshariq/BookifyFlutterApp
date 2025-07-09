// import 'package:bookify/screens/book_detail_page.dart';
// import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
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
// import 'package:bookify/screens/admin/screens/dashboard.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:bookify/utils/themes/themes.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'firebase_options.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   await Supabase.initialize(
//     url: 'https://gnuysoelfiqurqlhcmrt.supabase.co',
//     anonKey:
//         'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdudXlzb2VsZmlxdXJxbGhjbXJ0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTA3NjkzMzAsImV4cCI6MjA2NjM0NTMzMH0.PT_UHlxC_yXfHwiT6v5MXYZaf34EGvcZ3POC6vNlGxk',
//   );

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
//         '/home': (context) => const HomeScreen(),
//         '/catalog': (context) => const CatalogScreen(),
//         '/cart': (context) => const CartScreen(),
//         '/wishlist': (context) => const WishListScreen(),
//         '/profile': (context) => const ProfileScreen(),
//         '/novels': (context) => const NovelsPage(),
//         '/self-love': (context) => const SelfLovePage(),
//         '/science': (context) => const SciencePage(),
//         '/romance': (context) => const RomancePage(),
//         '/history': (context) => const HistoryPage(),
//         '/fantasy': (context) => const FantasyPage(),
//         '/poetry': (context) => const PoetryPage(),
//         '/action': (context) => const ActionPage(),
//       },
//       home: FutureBuilder(
//         future: _checkUserRole(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return SplashScreen();
//           } else if (snapshot.hasError) {
//             print("Error during role check: ${snapshot.error}");
//             return SplashScreen();
//           } else {
//             String? role = snapshot.data;
//             final user = fb_auth.FirebaseAuth.instance.currentUser;
//             print("Firebase UID: ${user?.uid}");

//             if (role == "Admin") {
//               return const Dashboard();
//             } else if (role == "User") {
//               return const HomeScreen();
//             } else {
//               return SplashScreen(); // fallback
//             }
//           }
//         },
//       ),
//     );
//   }

//   Future<String?> _checkUserRole() async {
//     fb_auth.User? user = fb_auth.FirebaseAuth.instance.currentUser;

//     if (user != null) {
//       print("Logged-in user UID: ${user.uid}");
//       final userDoc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(user.uid)
//           .get();

//       if (userDoc.exists) {
//         print("User role: ${userDoc['role']}");
//         return userDoc['role'];
//       } else {
//         print("User document does not exist");
//       }
//     } else {
//       print("No user logged in");
//     }

//     return null;
//   }
// }

import 'package:bookify/screens/book_detail_page.dart';
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
import 'package:bookify/screens/admin/screens/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bookify/utils/themes/themes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bookify/utils/themes/custom_themes/app_navbar.dart';

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
    // Create the search controller here so it's available globally
    final TextEditingController _searchController = TextEditingController();

    return MaterialApp(
      title: 'Bookify',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      initialRoute: '/',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/catalog': (context) => const CatalogScreen(),
        '/cart': (context) => const CartScreen(),
        '/wishlist': (context) => const WishListScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/novels': (context) => const NovelsPage(),
        '/self-love': (context) => const SelfLovePage(),
        '/science': (context) => const SciencePage(),
        '/romance': (context) => const RomancePage(),
        '/history': (context) => const HistoryPage(),
        '/fantasy': (context) => const FantasyPage(),
        '/poetry': (context) => const PoetryPage(),
        '/action': (context) => const ActionPage(),
      },
      home: FutureBuilder(
        future: _checkUserRole(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else if (snapshot.hasError) {
            print("Error during role check: ${snapshot.error}");
            return SplashScreen();
          } else {
            String? role = snapshot.data;
            final user = fb_auth.FirebaseAuth.instance.currentUser;
            print("Firebase UID: ${user?.uid}");

            if (role == "Admin") {
              return Dashboard();
            } else if (role == "User") {
              return HomeScreen(); // Pass the search controller
            } else {
              return SplashScreen(); // fallback
            }
          }
        },
      ),
    );
  }

  Future<String?> _checkUserRole() async {
    fb_auth.User? user = fb_auth.FirebaseAuth.instance.currentUser;

    if (user != null) {
      print("Logged-in user UID: ${user.uid}");
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        print("User role: ${userDoc['role']}");
        return userDoc['role'];
      } else {
        print("User document does not exist");
      }
    } else {
      print("No user logged in");
    }

    return null;
  }
}
