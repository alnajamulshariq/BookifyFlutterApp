// import 'package:bookify/screens/admin/screens/dashboard.dart';
// import 'package:bookify/screens/auth/users/forgetpass.dart';
// import 'package:bookify/screens/auth/users/sign_up.dart';
// import 'package:bookify/screens/home.dart';
// import 'package:bookify/showDialoguesAlert/login_fail_dialogue.dart';
// import 'package:bookify/utils/themes/custom_themes/elevated_button_theme.dart';
// import 'package:bookify/utils/themes/custom_themes/outlined_button_theme.dart';
// import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:bookify/utils/constants/colors.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore to fetch user role

// class SignIn extends StatefulWidget {
//   const SignIn({super.key});

//   @override
//   State<SignIn> createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   final formKey = GlobalKey<FormState>();
//   final emailController = TextEditingController();
//   final passController = TextEditingController();
//   bool _obscurePassword = true;
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn(
//     clientId:
//         '973647700649-siskhfmfdn3fhqsvmcn08ueeb67mllh1.apps.googleusercontent.com',
//   );

//   // Sign in with Google
//   Future<void> signInGoogle() async {
//     try {
//       final googleUser = await googleSignIn.signIn();
//       if (googleUser == null) return;
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       await _auth.signInWithCredential(credential);
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => HomeScreen()),
//       );
//     } catch (e) {
//       print("Google SignIn error: $e");
//     }
//   }

//   // Sign in with Email and Password and check role
//   Future<void> signInWithEmailAndPassword() async {
//     if (formKey.currentState!.validate()) {
//       try {
//         // Sign in with Firebase Authentication
//         UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passController.text.trim(),
//         );

//         // Get user data from Firestore
//         User? user = userCredential.user;

//         if (user != null) {
//           // Fetch role from Firestore
//           DocumentSnapshot userDoc = await FirebaseFirestore.instance
//               .collection('users')
//               .doc(user.uid)
//               .get();

//           if (userDoc.exists) {
//             String role = userDoc['role']; // Get the role field from Firestore

//             // Navigate based on role
//             if (role == "User") {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => const HomeScreen()),
//               );
//             } else if (role == "Admin") {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const Dashboard(),
//                 ), // Admin dashboard
//               );
//             }
//           } else {
//             print("Role not found.");
//           }
//         }
//       } catch (e) {
//         // Handle error
//         print("Sign in failed: $e");
//         showLoginFailDialog(context);
//         emailController.clear();
//         passController.clear();
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: MyColors.primary,
//       body: Stack(
//         children: [
//           Positioned(
//             top: 20,
//             left: 0,
//             right: 0,
//             child: Image.asset(
//               'assets/images/appLogo2.png',
//               height: 200,
//               fit: BoxFit.contain,
//             ),
//           ),
//           Positioned(
//             top: 220,
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: MyColors.bg,
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(34),
//                   topRight: Radius.circular(34),
//                 ),
//               ),
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const SizedBox(height: 10),

//                       // Email Field
//                       TextFormField(
//                         controller: emailController,
//                         keyboardType: TextInputType.emailAddress,
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         style: const TextStyle(color: Colors.black),
//                         decoration: _inputDecoration(
//                           label: 'Email',
//                           hint: 'Enter your email',
//                           icon: Icons.email,
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty)
//                             return "Email is required";
//                           final emailRegex = RegExp(
//                             r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
//                           );
//                           if (!emailRegex.hasMatch(value))
//                             return "Enter a valid email address";
//                           return null;
//                         },
//                       ),

//                       const SizedBox(height: 20),

//                       // Password Field
//                       TextFormField(
//                         controller: passController,
//                         obscureText: _obscurePassword,
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         style: const TextStyle(color: Colors.black),
//                         decoration:
//                             _inputDecoration(
//                               label: 'Password',
//                               hint: 'Enter your password',
//                               icon: Icons.lock,
//                             ).copyWith(
//                               suffixIcon: IconButton(
//                                 icon: Icon(
//                                   _obscurePassword
//                                       ? Icons.visibility_off
//                                       : Icons.visibility,
//                                   color: Colors.grey,
//                                 ),
//                                 onPressed: () {
//                                   setState(() {
//                                     _obscurePassword = !_obscurePassword;
//                                   });
//                                 },
//                               ),
//                             ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty)
//                             return "Password is required";
//                           final passRegex = RegExp(
//                             r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
//                           );
//                           if (!passRegex.hasMatch(value)) {
//                             return "Password must be at least 8 chars (upper, lower, digit, special)";
//                           }
//                           return null;
//                         },
//                       ),

//                       const SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           InkWell(
//                             onTap: () => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (_) => const ForgetPass(),
//                               ),
//                             ),
//                             child: Text(
//                               "Forget Password",
//                               style: TextStyle(
//                                 color: MyColors.primary,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(height: 20),

//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButtonTheme(
//                           data: MyElevatedButtonTheme.lightElevatedButtonTheme,
//                           child: ElevatedButton(
//                             onPressed:
//                                 signInWithEmailAndPassword, // Call the sign-in function
//                             child: const Text('Login'),
//                           ),
//                         ),
//                       ),

//                       const SizedBox(height: 20),
//                       Row(
//                         children: <Widget>[
//                           const Expanded(
//                             child: Divider(
//                               color: Colors.grey,
//                               thickness: 1,
//                               endIndent: 10,
//                             ),
//                           ),
//                           const Text(
//                             'Or continue with',
//                             style: TextStyle(color: Colors.grey),
//                           ),
//                           const Expanded(
//                             child: Divider(
//                               color: Colors.grey,
//                               thickness: 1,
//                               indent: 10,
//                             ),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(height: 25),

//                       SizedBox(
//                         width: double.infinity,
//                         child: OutlinedButtonTheme(
//                           data: MyOutlinedButtonTheme.lightOutlinedButtonTheme,
//                           child: OutlinedButton(
//                             onPressed: () async {
//                               // Google Login
//                               await signInGoogle();
//                             },
//                             style: OutlinedButton.styleFrom(
//                               padding: const EdgeInsets.all(18),
//                               side: const BorderSide(color: MyColors.primary),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 SizedBox(
//                                   height: 24,
//                                   width: 24,
//                                   child: Transform.scale(
//                                     scale: 1.7,
//                                     child: Image.asset(
//                                       'assets/images/googleIcon.png',
//                                       fit: BoxFit.contain,
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 12),
//                                 const Text(
//                                   'Continue with Google',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 18,
//                                     letterSpacing: 0.7,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),

//                       const SizedBox(height: 20),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Don't have an account? ",
//                             style: MyTextTheme.lightTextTheme.bodySmall,
//                           ),
//                           InkWell(
//                             onTap: () => Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => SignUp()),
//                             ),
//                             child: Text(
//                               "Sign Up",
//                               style: TextStyle(
//                                 color: MyColors.primary,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   InputDecoration _inputDecoration({
//     required String label,
//     required String hint,
//     required IconData icon,
//   }) {
//     return InputDecoration(
//       labelText: label,
//       hintText: hint,
//       labelStyle: const TextStyle(color: Colors.black),
//       hintStyle: const TextStyle(color: Colors.grey),
//       prefixIcon: Icon(icon, color: Colors.grey),
//       filled: true,
//       fillColor: Colors.white,
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(14),
//         borderSide: const BorderSide(color: MyColors.primary, width: 1),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(14),
//         borderSide: const BorderSide(color: MyColors.primary, width: 2),
//       ),
//     );
//   }
// }

// import 'package:bookify/screens/admin/screens/dashboard.dart';
// import 'package:bookify/screens/auth/users/forgetpass.dart';
// import 'package:bookify/screens/auth/users/sign_up.dart';
// import 'package:bookify/screens/home.dart';
// import 'package:bookify/showDialoguesAlert/login_fail_dialogue.dart';
// import 'package:bookify/utils/themes/custom_themes/elevated_button_theme.dart';
// import 'package:bookify/utils/themes/custom_themes/outlined_button_theme.dart';
// import 'package:bookify/showDialoguesAlert/login_success_dialogue.dart';
// import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:bookify/utils/constants/colors.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore to fetch user role

// class SignIn extends StatefulWidget {
//   const SignIn({super.key});

//   @override
//   State<SignIn> createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   final formKey = GlobalKey<FormState>();
//   final emailController = TextEditingController();
//   final passController = TextEditingController();
//   bool _obscurePassword = true;
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn(
//     clientId:
//         '973647700649-siskhfmfdn3fhqsvmcn08ueeb67mllh1.apps.googleusercontent.com',
//   );

//   // Sign in with Google
//   Future<void> signInGoogle() async {
//     try {
//       final googleUser = await googleSignIn.signIn();
//       if (googleUser == null) return;
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       await _auth.signInWithCredential(credential);
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => HomeScreen()),
//       );
//     } catch (e) {
//       print("Google SignIn error: $e");
//       showLoginFailDialog(
//         context,
//       ); // Show login fail dialog if Google SignIn fails
//     }
//   }

//   // Sign in with Email and Password and check role
//   Future<void> signInWithEmailAndPassword() async {
//     if (formKey.currentState!.validate()) {
//       try {
//         // Sign in with Firebase Authentication
//         UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passController.text.trim(),
//         );

//         // Get user data from Firestore
//         User? user = userCredential.user;

//         if (user != null) {
//           // Fetch role from Firestore
//           DocumentSnapshot userDoc = await FirebaseFirestore.instance
//               .collection('users')
//               .doc(user.uid)
//               .get();

//           if (userDoc.exists) {
//             String role = userDoc['role']; // Get the role field from Firestore

//             // Show login success dialog
//             showLoginSuccessDialog(context);

//             // Wait for 2 seconds before navigating
//             Future.delayed(const Duration(seconds: 2), () {
//               // Navigate based on role
//               if (role == "User") {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => const HomeScreen()),
//                 );
//               } else if (role == "Admin") {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const Dashboard(),
//                   ), // Admin dashboard
//                 );
//               }
//             });
//           } else {
//             print("Role not found.");
//           }
//         }
//       } catch (e) {
//         // Handle error during email/password login
//         print("Sign in failed: $e");
//         showLoginFailDialog(context); // Show the fail dialog if login fails
//         emailController.clear();
//         passController.clear();
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: MyColors.primary,
//       body: Stack(
//         children: [
//           Positioned(
//             top: 20,
//             left: 0,
//             right: 0,
//             child: Image.asset(
//               'assets/images/appLogo2.png',
//               height: 200,
//               fit: BoxFit.contain,
//             ),
//           ),
//           Positioned(
//             top: 220,
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: MyColors.bg,
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(34),
//                   topRight: Radius.circular(34),
//                 ),
//               ),
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const SizedBox(height: 10),

//                       // Email Field
//                       TextFormField(
//                         controller: emailController,
//                         keyboardType: TextInputType.emailAddress,
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         style: const TextStyle(color: Colors.black),
//                         decoration: _inputDecoration(
//                           label: 'Email',
//                           hint: 'Enter your email',
//                           icon: Icons.email,
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty)
//                             return "Email is required";
//                           final emailRegex = RegExp(
//                             r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
//                           );
//                           if (!emailRegex.hasMatch(value))
//                             return "Enter a valid email address";
//                           return null;
//                         },
//                       ),

//                       const SizedBox(height: 20),

//                       // Password Field
//                       TextFormField(
//                         controller: passController,
//                         obscureText: _obscurePassword,
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         style: const TextStyle(color: Colors.black),
//                         decoration:
//                             _inputDecoration(
//                               label: 'Password',
//                               hint: 'Enter your password',
//                               icon: Icons.lock,
//                             ).copyWith(
//                               suffixIcon: IconButton(
//                                 icon: Icon(
//                                   _obscurePassword
//                                       ? Icons.visibility_off
//                                       : Icons.visibility,
//                                   color: Colors.grey,
//                                 ),
//                                 onPressed: () {
//                                   setState(() {
//                                     _obscurePassword = !_obscurePassword;
//                                   });
//                                 },
//                               ),
//                             ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty)
//                             return "Password is required";
//                           final passRegex = RegExp(
//                             r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
//                           );
//                           if (!passRegex.hasMatch(value)) {
//                             return "Password must be at least 8 chars (upper, lower, digit, special)";
//                           }
//                           return null;
//                         },
//                       ),

//                       const SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           InkWell(
//                             onTap: () => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (_) => const ForgetPass(),
//                               ),
//                             ),
//                             child: Text(
//                               "Forget Password",
//                               style: TextStyle(
//                                 color: MyColors.primary,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(height: 20),

//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButtonTheme(
//                           data: MyElevatedButtonTheme.lightElevatedButtonTheme,
//                           child: ElevatedButton(
//                             onPressed:
//                                 signInWithEmailAndPassword, // Call the sign-in function
//                             child: const Text('Login'),
//                           ),
//                         ),
//                       ),

//                       const SizedBox(height: 20),
//                       Row(
//                         children: <Widget>[
//                           const Expanded(
//                             child: Divider(
//                               color: Colors.grey,
//                               thickness: 1,
//                               endIndent: 10,
//                             ),
//                           ),
//                           const Text(
//                             'Or continue with',
//                             style: TextStyle(color: Colors.grey),
//                           ),
//                           const Expanded(
//                             child: Divider(
//                               color: Colors.grey,
//                               thickness: 1,
//                               indent: 10,
//                             ),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(height: 25),

//                       SizedBox(
//                         width: double.infinity,
//                         child: OutlinedButtonTheme(
//                           data: MyOutlinedButtonTheme.lightOutlinedButtonTheme,
//                           child: OutlinedButton(
//                             onPressed: () async {
//                               // Google Login
//                               await signInGoogle();
//                             },
//                             style: OutlinedButton.styleFrom(
//                               padding: const EdgeInsets.all(18),
//                               side: const BorderSide(color: MyColors.primary),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 SizedBox(
//                                   height: 24,
//                                   width: 24,
//                                   child: Transform.scale(
//                                     scale: 1.7,
//                                     child: Image.asset(
//                                       'assets/images/googleIcon.png',
//                                       fit: BoxFit.contain,
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 12),
//                                 const Text(
//                                   'Continue with Google',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 18,
//                                     letterSpacing: 0.7,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),

//                       const SizedBox(height: 20),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Don't have an account? ",
//                             style: MyTextTheme.lightTextTheme.bodySmall,
//                           ),
//                           InkWell(
//                             onTap: () => Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => SignUp()),
//                             ),
//                             child: Text(
//                               "Sign Up",
//                               style: TextStyle(
//                                 color: MyColors.primary,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   InputDecoration _inputDecoration({
//     required String label,
//     required String hint,
//     required IconData icon,
//   }) {
//     return InputDecoration(
//       labelText: label,
//       hintText: hint,
//       labelStyle: const TextStyle(color: Colors.black),
//       hintStyle: const TextStyle(color: Colors.grey),
//       prefixIcon: Icon(icon, color: Colors.grey),
//       filled: true,
//       fillColor: Colors.white,
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(14),
//         borderSide: const BorderSide(color: MyColors.primary, width: 1),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(14),
//         borderSide: const BorderSide(color: MyColors.primary, width: 2),
//       ),
//     );
//   }
// }

import 'package:bookify/screens/admin/screens/dashboard.dart';
import 'package:bookify/screens/auth/users/forgetpass.dart';
import 'package:bookify/screens/auth/users/sign_up.dart';
import 'package:bookify/screens/home.dart';
import 'package:bookify/showDialoguesAlert/login_fail_dialogue.dart';
import 'package:bookify/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:bookify/utils/themes/custom_themes/outlined_button_theme.dart';
import 'package:bookify/showDialoguesAlert/login_success_dialogue.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool _obscurePassword = true;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId:
        '973647700649-siskhfmfdn3fhqsvmcn08ueeb67mllh1.apps.googleusercontent.com',
  );

  // ✅ Sign in with Email/Password and block check
  Future<void> signInWithEmailAndPassword() async {
    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passController.text.trim(),
        );

        User? user = userCredential.user;

        if (user != null) {
          DocumentSnapshot userDoc = await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();

          if (!userDoc.exists) {
            await _auth.signOut();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("User record not found.")),
            );
            return;
          }

          final data = userDoc.data() as Map<String, dynamic>;

          // 🔒 Blocked check
          if (data['enabled'] == false) {
            await _auth.signOut();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("This user is blocked by admin")),
            );
            return;
          }

          final role = data['role'] ?? 'User';

          showLoginSuccessDialog(context);

          Future.delayed(const Duration(seconds: 2), () {
            if (role == "User") {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
            } else if (role == "Admin") {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const Dashboard()),
              );
            }
          });
        }
      } catch (e) {
        print("Sign in failed: $e");
        showLoginFailDialog(context);
        emailController.clear();
        passController.clear();
      }
    }
  }

  // ⚠️ OPTIONAL: Add similar block check here if using Google sign-in for restricted users
  Future<void> signInGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      User? user = userCredential.user;

      if (user != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (userDoc.exists && userDoc.data()?['enabled'] == false) {
          await _auth.signOut();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("This user is blocked by admin")),
          );
          return;
        }
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } catch (e) {
      print("Google SignIn error: $e");
      showLoginFailDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: MyColors.primary,
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/appLogo2.png',
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 220,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: MyColors.bg,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(34),
                  topRight: Radius.circular(34),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: Colors.black),
                        decoration: _inputDecoration(
                          label: 'Email',
                          hint: 'Enter your email',
                          icon: Icons.email,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Email is required";
                          final emailRegex = RegExp(
                            r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                          );
                          if (!emailRegex.hasMatch(value))
                            return "Enter a valid email address";
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: passController,
                        obscureText: _obscurePassword,
                        style: const TextStyle(color: Colors.black),
                        decoration:
                            _inputDecoration(
                              label: 'Password',
                              hint: 'Enter your password',
                              icon: Icons.lock,
                            ).copyWith(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(
                                    () => _obscurePassword = !_obscurePassword,
                                  );
                                },
                              ),
                            ),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Password is required";
                          final passRegex = RegExp(
                            r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                          );
                          if (!passRegex.hasMatch(value)) {
                            return "Password must be at least 8 chars (upper, lower, digit, special)";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ForgetPass(),
                              ),
                            ),
                            child: Text(
                              "Forget Password",
                              style: TextStyle(color: MyColors.primary),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: signInWithEmailAndPassword,
                          child: const Text('Login'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: const [
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                              endIndent: 10,
                            ),
                          ),
                          Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                              indent: 10,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: signInGoogle,
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(18),
                            side: const BorderSide(color: MyColors.primary),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 24,
                                width: 24,
                                child: Transform.scale(
                                  scale: 1.7,
                                  child: Image.asset(
                                    'assets/images/googleIcon.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'Continue with Google',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  letterSpacing: 0.7,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: MyTextTheme.lightTextTheme.bodySmall,
                          ),
                          InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => SignUp()),
                            ),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: MyColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(color: Colors.black),
      hintStyle: const TextStyle(color: Colors.grey),
      prefixIcon: Icon(icon, color: Colors.grey),
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: MyColors.primary, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: MyColors.primary, width: 2),
      ),
    );
  }
}
