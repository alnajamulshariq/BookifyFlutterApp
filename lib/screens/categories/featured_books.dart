// import 'package:bookify/screens/auth/users/sign_in.dart';
// import 'package:bookify/utils/constants/colors.dart';
// import 'package:bookify/utils/themes/custom_themes/bookcard.dart';
// import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class FeaturedPage extends StatefulWidget {
//   const FeaturedPage({super.key});

//   @override
//   State<FeaturedPage> createState() => _FeaturedPageState();
// }

// class _FeaturedPageState extends State<FeaturedPage> {
//   bool _showSearchBar = false;
//   final TextEditingController _searchController = TextEditingController();
//   final auth = FirebaseAuth.instance;
//   final List<String> categories = [
//     'Novels',
//     'Self Love',
//     'Science',
//     'Romance',
//     'History',
//     'Fantasy',
//     'Poetry',
//     'Action',
//   ];
//   // int selectedIndex = 0;
//   void navigateToCategory(String title) {
//     if (title == 'Novels') {
//       Navigator.pushNamed(context, '/novels');
//     } else if (title == 'Self Love') {
//       Navigator.pushNamed(context, '/self-love');
//     } else if (title == 'Science') {
//       Navigator.pushNamed(context, '/science');
//     } else if (title == 'Romance') {
//       Navigator.pushNamed(context, '/romance');
//     } else if (title == 'History') {
//       Navigator.pushNamed(context, '/history');
//     } else if (title == 'Fantasy') {
//       Navigator.pushNamed(context, '/fantasy');
//     } else if (title == 'Poetry') {
//       Navigator.pushNamed(context, '/poetry');
//     } else if (title == 'Action') {
//       Navigator.pushNamed(context, '/action');
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("No page found for category: $title")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFeeeeee),
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(height: 30),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Row(
//                 children: [
//                   ClipOval(
//                     child: Image.asset(
//                       "assets/images/b.jpg",
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

//             SizedBox(height: 10),

//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: SizedBox(
//                 height: 45,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: categories.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 10),
//                       child: GestureDetector(
//                         onTap: () => navigateToCategory(categories[index]),
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 16,
//                             vertical: 10,
//                           ),
//                           decoration: BoxDecoration(
//                             color: const Color.fromARGB(129, 178, 223, 219),
//                             borderRadius: BorderRadius.circular(25),
//                             border: Border.all(
//                               color: Color.fromARGB(129, 178, 223, 219),
//                             ),
//                           ),
//                           child: Text(
//                             categories[index],
//                             style: const TextStyle(
//                               color: MyColors.primary,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),

//             const SizedBox(height: 10),
//             Center(
//               child: Text(
//                 "Featured Books",
//                 style: MyTextTheme.lightTextTheme.headlineMedium,
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 11),
//                 child: GridView.builder(
//                   itemCount: 10,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 16,
//                     mainAxisSpacing: 20,
//                     childAspectRatio: 0.67,
//                   ),
//                   itemBuilder: (context, index) {
//                     return BookCard(
//                       imagePath: 'assets/images/thespidy.jpg',
//                       title: 'Atomic Habits',
//                       category: 'Self Help',
//                       price: 58,
//                       rating: 4.7,
//                     );
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:bookify/screens/auth/users/sign_in.dart';
import 'package:bookify/screens/book_detail_page.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/app_navbar.dart';
import 'package:bookify/utils/themes/custom_themes/bookcard.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FeaturedPage extends StatefulWidget {
  const FeaturedPage({super.key});

  @override
  State<FeaturedPage> createState() => _FeaturedPageState();
}

class _FeaturedPageState extends State<FeaturedPage> {
  final auth = FirebaseAuth.instance;
  String _currentSortField = 'title';
  bool _isDescending = false;
  late Stream<QuerySnapshot> _booksStream;

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

  @override
  void initState() {
    super.initState();
    _updateStream();
  }

  void _updateStream() {
    _booksStream = FirebaseFirestore.instance
        .collection('books')
        .where('is_featured', isEqualTo: true)
        .orderBy(_currentSortField, descending: _isDescending)
        .snapshots();
  }

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
      switch (criteria) {
        case "Price: Low to High":
          _currentSortField = 'price';
          _isDescending = false;
          break;
        case "Price: High to Low":
          _currentSortField = 'price';
          _isDescending = true;
          break;
        case "Top Rated":
          _currentSortField = 'rating';
          _isDescending = true;
          break;
        default:
          _currentSortField = 'title';
          _isDescending = false;
      }
      _updateStream();
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

            // Categories List
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
                              color: const Color.fromARGB(129, 178, 223, 219),
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

            // Filter + Title Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Featured Books",
                    style: MyTextTheme.lightTextTheme.headlineMedium,
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      popupMenuTheme: const PopupMenuThemeData(
                        color: Colors.white,
                        surfaceTintColor: Colors.transparent,
                        textStyle: TextStyle(
                          color: Colors.teal,
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

            // Dynamic Books Grid from Firestore
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 16),
            //     child: StreamBuilder<QuerySnapshot>(
            //       stream: _booksStream,
            //       builder: (context, snapshot) {
            //         if (snapshot.connectionState == ConnectionState.waiting) {
            //           return const Center(child: CircularProgressIndicator());
            //         }

            //         if (snapshot.hasError) {
            //           debugPrint('Firestore Error: ${snapshot.error}');
            //           return Center(
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 const Text('Failed to load books'),
            //                 ElevatedButton(
            //                   onPressed: _updateStream,
            //                   child: const Text('Retry'),
            //                 ),
            //               ],
            //             ),
            //           );
            //         }

            //         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            //           return const Center(
            //             child: Text(
            //               'No featured books available.',
            //               style: TextStyle(color: MyColors.primary),
            //             ),
            //           );
            //         }

            //         final books = snapshot.data!.docs;

            //         return GridView.builder(
            //           itemCount: books.length,
            //           gridDelegate:
            //               const SliverGridDelegateWithFixedCrossAxisCount(
            //                 crossAxisCount: 2,
            //                 crossAxisSpacing: 16,
            //                 mainAxisSpacing: 20,
            //                 childAspectRatio: 0.63,
            //               ),
            //           itemBuilder: (context, index) {
            //             final book =
            //                 books[index].data() as Map<String, dynamic>;
            //             return BookCard(
            //               imagePath:
            //                   book['cover_image_url'] ??
            //                   'assets/images/appLogo.png',
            //               title: book['title'] ?? 'No Title',
            //               category: book['genre'] ?? 'No Category',
            //               price: book['price']?.toDouble() ?? 0.0,
            //               rating: book['rating']?.toDouble() ?? 0.0,
            //             );
            //           },
            //         );
            //       },
            //     ),
            //   ),
            // ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: StreamBuilder<QuerySnapshot>(
                  stream: _booksStream, // Your Stream<QuerySnapshot>
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      debugPrint('Firestore Error: ${snapshot.error}');
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Failed to load books'),
                            ElevatedButton(
                              onPressed: _updateStream,
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      );
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text(
                          'No featured books available.',
                          style: TextStyle(color: MyColors.primary),
                        ),
                      );
                    }

                    final books = snapshot.data!.docs;

                    return GridView.builder(
                      itemCount: books.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 20,
                            childAspectRatio: 0.63,
                          ),
                      itemBuilder: (context, index) {
                        final doc = books[index];
                        final book = doc.data() as Map<String, dynamic>;
                        final String bookId = doc.id;

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        BookDetailPage(bookId: bookId),
                                transitionsBuilder:
                                    (
                                      context,
                                      animation,
                                      secondaryAnimation,
                                      child,
                                    ) {
                                      const begin = Offset(0.0, 1.0);
                                      const end = Offset.zero;
                                      const curve = Curves.easeInOut;
                                      final tween = Tween(
                                        begin: begin,
                                        end: end,
                                      ).chain(CurveTween(curve: curve));
                                      return SlideTransition(
                                        position: animation.drive(tween),
                                        child: child,
                                      );
                                    },
                              ),
                            );
                          },
                          child: Hero(
                            tag: bookId,
                            child: Material(
                              color: Colors.transparent,
                              child: BookCard(
                                imagePath:
                                    book['cover_image_url'] ??
                                    'assets/images/appLogo.png',
                                title: book['title'] ?? 'No Title',
                                category: book['genre'] ?? 'No Category',
                                price: book['price']?.toDouble() ?? 0.0,
                                rating: book['rating']?.toDouble() ?? 0.0,
                              ),
                            ),
                          ),
                        );
                      },
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
