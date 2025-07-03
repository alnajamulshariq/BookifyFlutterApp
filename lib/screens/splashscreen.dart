// import 'package:bookify/screens/home.dart';
// import 'package:bookify/screens/onboarding.dart';
// import 'package:bookify/utils/constants/colors.dart';
// import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     final auth = FirebaseAuth.instance;
//     final user = auth.currentUser;
//     if (user != null) {
//       Future.delayed(Duration(seconds: 3), () {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => HomeScreen()),
//         );
//       });
//     } else {
//       Future.delayed(Duration(seconds: 5), () {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => OnBoarding()),
//         );
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MyColors.primary,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Lottie.asset('assets/animations/book_ani2.json'),

//             SizedBox(height: 10),

//             // Text(
//             //   "Bookify",
//             //   style: TextStyle(
//             //     fontSize: 32,
//             //     fontWeight: FontWeight.bold,
//             //     color: Colors.white,
//             //   ),
//             // ),
//             Text('Bookify', style: MyTextTheme.lightTextTheme.headlineLarge),

//             SizedBox(height: 10),

//             CircularProgressIndicator(color: Colors.white),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:bookify/screens/home.dart';
import 'package:bookify/screens/onboarding.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      Future.delayed(Duration(seconds: 3), () {
        if (!mounted) return; // ✅ check before navigation
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      });
    } else {
      Future.delayed(Duration(seconds: 5), () {
        if (!mounted) return; // ✅ check before navigation
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnBoarding()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/book_ani2.json'),
            SizedBox(height: 10),
            Text('Bookify', style: MyTextTheme.lightTextTheme.headlineLarge),
            SizedBox(height: 10),
            CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
