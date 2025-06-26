import 'package:bookify/screens/auth/users/sign_in.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/app_navbar.dart';
import 'package:bookify/utils/themes/custom_themes/bookcard.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ActionPage extends StatefulWidget {
  const ActionPage({super.key});

  @override
  State<ActionPage> createState() => _ActionPageState();
}

class _ActionPageState extends State<ActionPage> {
  final auth = FirebaseAuth.instance;
  final List<Map<String, dynamic>> books = [
    {
      'imagePath': 'assets/images/thespidy.jpg',
      'title': 'Atomic Habits',
      'category': 'Self Help',
      'price': 58.01,
      'rating': 4.7,
    },
    {
      'imagePath': 'assets/images/thespidy.jpg',
      'title': 'The Art of War',
      'category': 'Strategy',
      'price': 72.01,
      'rating': 4.4,
    },
    {
      'imagePath': 'assets/images/thespidy.jpg',
      'title': 'Rich Dad Poor Dad',
      'category': 'Finance',
      'price': 65.01,
      'rating': 4.5,
    },
    {
      'imagePath': 'assets/images/thespidy.jpg',
      'title': 'The Alchemist',
      'category': 'Fiction',
      'price': 70.01,
      'rating': 4.6,
    },
    {
      'imagePath': 'assets/images/thespidy.jpg',
      'title': 'Atomic Habits',
      'category': 'Self Help',
      'price': 58.01,
      'rating': 4.7,
    },
    {
      'imagePath': 'assets/images/thespidy.jpg',
      'title': 'The Art of War',
      'category': 'Strategy',
      'price': 72.01,
      'rating': 4.4,
    },
    {
      'imagePath': 'assets/images/thespidy.jpg',
      'title': 'Rich Dad Poor Dad',
      'category': 'Finance',
      'price': 65.01,
      'rating': 4.5,
    },
    {
      'imagePath': 'assets/images/thespidy.jpg',
      'title': 'The Alchemist',
      'category': 'Fiction',
      'price': 70.01,
      'rating': 4.6,
    },
    {
      'imagePath': 'assets/images/thespidy.jpg',
      'title': 'Rich Dad Poor Dad',
      'category': 'Finance',
      'price': 65.01,
      'rating': 4.5,
    },
    {
      'imagePath': 'assets/images/thespidy.jpg',
      'title': 'The Alchemist',
      'category': 'Fiction',
      'price': 70.01,
      'rating': 4.6,
    },
  ];

  final List<String> categories = [
    'Novels',
    'Self Love',
    'Science',
    'Romance',
    'History',
    'Fantasy',
    'Poetry',
    'Action',
  ];

  void navigateToCategory(String title) {
    final routes = {
      'Novels': '/novels',
      'Self Love': '/self-love',
      'Science': '/science',
      'Romance': '/romance',
      'History': '/history',
      'Fantasy': '/fantasy',
      'Poetry': '/poetry',
      'Action': '/action',
    };
    if (routes.containsKey(title)) {
      Navigator.pushNamed(context, routes[title]!);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No page found for category: $title")),
      );
    }
  }

  void sortBooks(String criteria) {
    setState(() {
      if (criteria == "Price: Low to High") {
        books.sort((a, b) => a['price'].compareTo(b['price']));
      } else if (criteria == "Price: High to Low") {
        books.sort((a, b) => b['price'].compareTo(a['price']));
      } else if (criteria == "Top Rated") {
        books.sort((a, b) => b['rating'].compareTo(a['rating']));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeeeeee),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const CustomNavBar(),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () => navigateToCategory(categories[index]),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(129, 178, 223, 219),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Color.fromARGB(129, 178, 223, 219),
                            ),
                          ),
                          child: Text(
                            categories[index],
                            style: const TextStyle(
                              color: MyColors.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            /// Filter + Title Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Action",
                    style: MyTextTheme.lightTextTheme.headlineMedium,
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      popupMenuTheme: PopupMenuThemeData(
                        color: Colors.white, // ✅ Popup background color
                        surfaceTintColor:
                            Colors.transparent, // Prevents dark blending
                        textStyle: const TextStyle(
                          color: Colors.teal, // ✅ Your themed text color
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    child: PopupMenuButton<String>(
                      icon: Icon(Icons.filter_list, color: MyColors.primary),
                      onSelected: sortBooks,
                      itemBuilder: (context) => const [
                        PopupMenuItem(
                          value: "Price: Low to High",
                          child: Text(
                            "Price: Low to High",
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: "Price: High to Low",
                          child: Text(
                            "Price: High to Low",
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: "Top Rated",
                          child: Text(
                            "Top Rated",
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Grid of Books
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  itemCount: books.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.63,
                  ),
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return BookCard(
                      imagePath: book['imagePath'],
                      title: book['title'],
                      category: book['category'],
                      price: book['price'],
                      rating: book['rating'],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
