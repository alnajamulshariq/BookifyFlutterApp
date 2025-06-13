import 'package:bookify/screens/auth/users/sign_in.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/bookcard.dart';
import 'package:bookify/utils/themes/custom_themes/bottomnavbar.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showSearchBar = false;
  final TextEditingController _searchController = TextEditingController();

  final List<String> categories = [
    'Novels',
    'Self Love',
    'Science',
    'Romance',
    'History',
    'Fantasy',
    'Poetry',
  ];
  int selectedIndex = 0;

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeeeeee),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 18),
              Row(
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
                  SizedBox(width: 10),
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

              if (_showSearchBar)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextField(
                    controller: _searchController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Search...",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ), // optional: control hint color
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),

              const SizedBox(height: 30),

              // Stack with green header and white card
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: 230,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0C8A6C),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Find interesting books from\nall over the world",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    left: 20,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "On conviction to imprisonment for a period\nnot exceeding four years...",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Continue Reading",
                            style: TextStyle(
                              color: Color(0xFF0C8A6C),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/b.jpg',
                                  width: 55,
                                  height: 55,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Born a Crime, Stories from a South African Childhood",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "Chapter 1 of 4",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 100), // space below white card
              // Horizontally scrollable categories
              SizedBox(
                height: 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  itemBuilder: (context, index) {
                    final bool isSelected = index == selectedIndex;
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFFE0F2F1)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF0C8A6C)
                                  : Colors.grey.shade300,
                            ),
                          ),
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              color: isSelected
                                  ? const Color(0xFF0C8A6C)
                                  : Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),

              SizedBox(
                height: 260,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    BookCard(
                      imagePath: 'assets/images/thespidy.jpg',
                      title: 'Sun Tzu – The Art of War',
                      category: 'Strategic, Fantasy',
                      price: 72,
                      rating: 4.4,
                    ),
                    BookCard(
                      imagePath: 'assets/images/thespidy.jpg',
                      title: 'Atomic Habits',
                      category: 'Self Help',
                      price: 58,
                      rating: 4.7,
                    ),
                    BookCard(
                      imagePath: 'assets/images/thespidy.jpg',
                      title: 'Sun Tzu – The Art of War',
                      category: 'Strategic, Fantasy',
                      price: 72,
                      rating: 4.4,
                    ),
                    BookCard(
                      imagePath: 'assets/images/thespidy.jpg',
                      title: 'Atomic Habits',
                      category: 'Self Help',
                      price: 58,
                      rating: 4.7,
                    ),
                    BookCard(
                      imagePath: 'assets/images/thespidy.jpg',
                      title: 'Sun Tzu – The Art of War',
                      category: 'Strategic, Fantasy',
                      price: 72,
                      rating: 4.4,
                    ),
                    BookCard(
                      imagePath: 'assets/images/thespidy.jpg',
                      title: 'Atomic Habits',
                      category: 'Self Help',
                      price: 58,
                      rating: 4.7,
                    ),
                    BookCard(
                      imagePath: 'assets/images/thespidy.jpg',
                      title: 'Sun Tzu – The Art of War',
                      category: 'Strategic, Fantasy',
                      price: 72,
                      rating: 4.4,
                    ),
                    BookCard(
                      imagePath: 'assets/images/thespidy.jpg',
                      title: 'Atomic Habits',
                      category: 'Self Help',
                      price: 58,
                      rating: 4.7,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildCurvedNavBar(context, 0),
    );
  }
}
