// import 'package:bookify/screens/auth/users/sign_in.dart';
// import 'package:bookify/utils/constants/colors.dart';
// import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class Checkout extends StatefulWidget {
//   const Checkout({super.key});

//   @override
//   State<Checkout> createState() => _CheckoutState();
// }

// class _CheckoutState extends State<Checkout> {
//   bool _showSearchBar = false;
//   final TextEditingController _searchController = TextEditingController();
//   final auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFeeeeee),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 30),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Row(
//                 children: [
//                   // if (user?.photoURL != null)
//                   ClipOval(
//                     child: Image.asset(
//                       "assets/images/b.jpg",
//                       // user!.photoURL!,
//                       width: 40,
//                       height: 40,
//                       fit: BoxFit.cover,
//                     ),
//                   ),

//                   const SizedBox(width: 10),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         // "Hi, ${user?.displayName ?? "Guest"}",
//                         "Hi, Shariq",
//                         style: MyTextTheme.lightTextTheme.titleLarge,
//                       ),
//                       const Text(
//                         "Have a nice day",
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const Spacer(),
//                   InkWell(
//                     onTap: () {
//                       setState(() {
//                         _showSearchBar = !_showSearchBar;
//                       });
//                     },
//                     child: Icon(
//                       Icons.search_rounded,
//                       color: MyColors.primary,
//                       size: 30,
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   InkWell(
//                     onTap: () {
//                       auth.signOut().then((value) {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(builder: (context) => SignIn()),
//                         );
//                       });
//                     },
//                     child: Icon(
//                       Icons.logout,
//                       color: MyColors.primary,
//                       size: 30,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             if (_showSearchBar)
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
//                 child: TextField(
//                   controller: _searchController,
//                   style: const TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                     hintText: "Search...",
//                     hintStyle: const TextStyle(color: Colors.grey),
//                     prefixIcon: const Icon(Icons.search, color: Colors.grey),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                 ),
//               ),
//             const SizedBox(height: 10),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:bookify/screens/auth/users/sign_in.dart';
import 'package:bookify/screens/home.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  bool _showSearchBar = false;
  final TextEditingController _searchController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeeeeee),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/b.jpg",
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, Shariq",
                            style: MyTextTheme.lightTextTheme.titleLarge,
                          ),
                          const Text(
                            "Ready to checkout?",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _showSearchBar = !_showSearchBar;
                          });
                        },
                        child: Icon(
                          Icons.search_rounded,
                          color: MyColors.primary,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          auth.signOut().then((value) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => SignIn()),
                            );
                          });
                        },
                        child: Icon(
                          Icons.logout,
                          color: MyColors.primary,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),

                if (_showSearchBar)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: "Search...",
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),

                const SizedBox(height: 60),

                // 🔹 Address Container Styled
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.teal.shade200,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Text(
                      "House #12, Street 5,\nKarachi, Pakistan",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 🔹 Order Summary Styled Box
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.teal.shade200,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Items Total",
                              style: TextStyle(color: MyColors.primary),
                            ),
                            Text(
                              "\$39.96",
                              style: TextStyle(color: Colors.teal),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery Charges",
                              style: TextStyle(color: MyColors.primary),
                            ),
                            Text(
                              "\$2.00",
                              style: TextStyle(color: Colors.teal),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(thickness: 1),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MyColors.primary,
                              ),
                            ),
                            Text(
                              "\$41.96",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 90),
              ],
            ),

            // ✅ Styled Place Order Button
            Positioned(
              bottom: 16,
              left: 24,
              right: 24,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButtonTheme(
                  data: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Order placed successfully!"),
                        ),
                      );
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      });
                    },
                    child: const Text(
                      "Place Order",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
