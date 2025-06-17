import 'package:bookify/screens/auth/users/sign_in.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/bookcard.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SciencePage extends StatefulWidget {
  const SciencePage({super.key});

  @override
  State<SciencePage> createState() => _SciencePageState();
}

class _SciencePageState extends State<SciencePage> {
  bool _showSearchBar = false;
  final TextEditingController _searchController = TextEditingController();
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
                    "Science",
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
