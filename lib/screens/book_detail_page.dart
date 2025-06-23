import 'package:bookify/screens/auth/users/sign_in.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookDetailPage extends StatefulWidget {
  final Map<String, dynamic> book;

  const BookDetailPage({super.key, required this.book});

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  bool _showSearchBar = false;
  final TextEditingController _searchController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final book = widget.book;

    return Scaffold(
      backgroundColor: const Color(0xFFeeeeee),
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
                    onTap: () =>
                        setState(() => _showSearchBar = !_showSearchBar),
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
                          MaterialPageRoute(
                            builder: (context) => const SignIn(),
                          ),
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
                    hintText: "Search...",
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

            /// Scrollable Detail Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Book Image
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          book['imagePath'],
                          width: 200,
                          height: 280,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Title
                    Text(
                      book['title'],
                      style: MyTextTheme.lightTextTheme.headlineMedium,
                    ),

                    const SizedBox(height: 6),

                    // ✅ Author
                    if (book.containsKey('author'))
                      Text(
                        "By ${book['author']}",
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),

                    const SizedBox(height: 8),

                    // Category
                    Text(
                      book['category'],
                      style: const TextStyle(color: Colors.teal, fontSize: 16),
                    ),

                    const SizedBox(height: 16),

                    // Price & Rating
                    Row(
                      children: [
                        Text(
                          "\$${book['price']}",
                          style: const TextStyle(
                            color: MyColors.primary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber),
                            const SizedBox(width: 4),
                            Text(
                              book['rating'].toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.deepOrange,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Description
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: MyColors.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "This is a placeholder book description. You can fetch and show dynamic descriptions from Firebase.",
                      style: TextStyle(fontSize: 15, color: Colors.teal),
                    ),

                    const SizedBox(height: 32),

                    // Add to Cart Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          // Add to cart logic here
                        },
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
