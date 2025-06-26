import 'package:bookify/screens/auth/users/sign_in.dart';
import 'package:bookify/screens/edit_profile.dart';
import 'package:bookify/screens/user_orders.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/app_navbar.dart';
import 'package:bookify/utils/themes/custom_themes/bottomnavbar.dart';
import 'package:bookify/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final auth = FirebaseAuth.instance;

  // Dynamic Data from Firestore
  String name = '';
  String email = '';
  String contact = '';
  String address = '';
  String profileImage = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      try {
        final doc = await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .get();
        final data = doc.data();

        if (data != null) {
          setState(() {
            name = data['name'] ?? '';
            email = data['email'] ?? '';
            contact = data['phone'] ?? '';
            address = data['address'] ?? '';
            profileImage = data['profile_image_url'] ?? '';
          });
        }
      } catch (e) {
        print("Error fetching profile: $e");
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeeeeee),
      bottomNavigationBar: buildCurvedNavBar(context, 4),
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  const SizedBox(height: 30),
                  const CustomNavBar(),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserOrders(),
                            ),
                          );
                        },
                        child: Text(
                          "View Orders",
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Center(
                    child: Text(
                      "Profile Details",
                      style: MyTextTheme.lightTextTheme.headlineMedium
                          ?.copyWith(color: MyColors.primary),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ClipOval(
                      child: profileImage.isNotEmpty
                          ? Image.network(
                              profileImage,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            )
                          : const Icon(
                              Icons.person,
                              size: 100,
                              color: Colors.grey,
                            ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  _buildInfoRow("Name:", name),
                  _buildInfoRow("Email:", email),
                  _buildInfoRow("Contact:", contact),
                  _buildInfoRow("Address:", address),

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
                                builder: (context) => const EditProfileScreen(),
                              ),
                            );
                          },
                          child: const Text("Edit Profile"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(158, 205, 249, 239),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: MyColors.primary, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Text(
                label,
                style: MyTextTheme.lightTextTheme.headlineSmall?.copyWith(
                  color: MyColors.primary,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  value,
                  style: MyTextTheme.lightTextTheme.titleMedium?.copyWith(
                    color: Colors.teal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
