import 'package:bookify/screens/auth/users/sign_in.dart';
import 'package:bookify/screens/edit_profile.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/bottomnavbar.dart';
import 'package:bookify/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _showSearchBar = false;
  final TextEditingController _searchController = TextEditingController();
  final auth = FirebaseAuth.instance;

  // Static Data for Profile
  String name = "Shariq";
  String email = "shariq@example.com";
  String contact = "+92 300 1234567";
  String address = "Karachi, Pakistan";
  String profileImage = "assets/images/b.jpg"; // Use an existing image path
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeeeeee),
      bottomNavigationBar: buildCurvedNavBar(context, 4),
      body: SafeArea(
        child: Column(
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
                        "Have a nice day",
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
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Search your wishlist...",
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            const SizedBox(height: 10),

            Center(
              child: Text(
                "Profile Details",
                style: MyTextTheme.lightTextTheme.headlineMedium?.copyWith(
                  color: MyColors.primary,
                ),
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ClipOval(
                child: Image.asset(
                  profileImage, // Path to your profile image
                  width: 100, // Width of the circular image
                  height: 100, // Height of the circular image
                  fit: BoxFit.cover, // Ensures the image fits inside the circle
                ),
              ),
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(158, 205, 249, 239),
                  borderRadius: BorderRadius.circular(16), // Round the corners
                  border: Border.all(
                    color: MyColors.primary, // Border color
                    width: 1, // Border width
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ), // Inner padding for content
                  child: Row(
                    children: [
                      Text(
                        "Name:",
                        style: MyTextTheme.lightTextTheme.headlineSmall
                            ?.copyWith(color: MyColors.primary),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "$name",
                        style: MyTextTheme.lightTextTheme.titleMedium?.copyWith(
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(158, 205, 249, 239),
                  borderRadius: BorderRadius.circular(16), // Round the corners
                  border: Border.all(
                    color: MyColors.primary, // Border color
                    width: 1, // Border width
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ), // Inner padding for content
                  child: Row(
                    children: [
                      Text(
                        "Email:",
                        style: MyTextTheme.lightTextTheme.headlineSmall
                            ?.copyWith(color: MyColors.primary),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "$email",
                        style: MyTextTheme.lightTextTheme.titleMedium?.copyWith(
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(158, 205, 249, 239),
                  borderRadius: BorderRadius.circular(16), // Round the corners
                  border: Border.all(
                    color: MyColors.primary, // Border color
                    width: 1, // Border width
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ), // Inner padding for content
                  child: Row(
                    children: [
                      Text(
                        "Contact:",
                        style: MyTextTheme.lightTextTheme.headlineSmall
                            ?.copyWith(color: MyColors.primary),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "$contact",
                        style: MyTextTheme.lightTextTheme.titleMedium?.copyWith(
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(158, 205, 249, 239),
                  borderRadius: BorderRadius.circular(16), // Round the corners
                  border: Border.all(
                    color: MyColors.primary, // Border color
                    width: 1, // Border width
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ), // Inner padding for content
                  child: Row(
                    children: [
                      Text(
                        "Address:",
                        style: MyTextTheme.lightTextTheme.headlineSmall
                            ?.copyWith(color: MyColors.primary),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "$address",
                        style: MyTextTheme.lightTextTheme.titleMedium?.copyWith(
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButtonTheme(
                  data: MyElevatedButtonTheme.lightElevatedButtonTheme,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                      );
                    },
                    child: Text("Edit Profile"),
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
