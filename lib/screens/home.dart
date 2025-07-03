import 'package:bookify/screens/all_books.dart';
import 'package:bookify/screens/auth/users/sign_in.dart';
import 'package:bookify/screens/book_detail_page.dart';
import 'package:bookify/screens/categories/best_seller.dart';
import 'package:bookify/screens/categories/featured_books.dart';
import 'package:bookify/screens/categories/popular_books.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/app_navbar.dart';
import 'package:bookify/utils/themes/custom_themes/bookcard.dart';
import 'package:bookify/utils/themes/custom_themes/bottomnavbar.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // bool _showSearchBar = false;
  // final TextEditingController _searchController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;

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
  // int selectedIndex = 0;
  void navigateToCategory(String title) {
    if (title == 'Novels') {
      Navigator.pushNamed(context, '/novels');
    } else if (title == 'Self Love') {
      Navigator.pushNamed(context, '/self-love');
    } else if (title == 'Science') {
      Navigator.pushNamed(context, '/science');
    } else if (title == 'Romance') {
      Navigator.pushNamed(context, '/romance');
    } else if (title == 'History') {
      Navigator.pushNamed(context, '/history');
    } else if (title == 'Fantasy') {
      Navigator.pushNamed(context, '/fantasy');
    } else if (title == 'Poetry') {
      Navigator.pushNamed(context, '/poetry');
    } else if (title == 'Action') {
      Navigator.pushNamed(context, '/action');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No page found for category: $title")),
      );
    }
  }

  final auth = FirebaseAuth.instance;

  // Dynamic Data from Firestore
  String name = '';
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
            // email = data['email'] ?? '';
            // contact = data['phone'] ?? '';
            // address = data['address'] ?? '';
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
      bottomNavigationBar: buildCurvedNavBar(context, 0),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const CustomNavBar(),

            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
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
                            child: const Text(
                              "Find interesting books from\nthe Bookify App",
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
                                boxShadow: const [
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
                                    "Top Crime Story",
                                    style: TextStyle(
                                      color: Color(0xFF0C8A6C),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
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
                                      const Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
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
                      const SizedBox(height: 100),
                      SizedBox(
                        height: 45,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () =>
                                    navigateToCategory(categories[index]),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      129,
                                      178,
                                      223,
                                      219,
                                    ),
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

                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Featured Books",
                            style: MyTextTheme.lightTextTheme.headlineSmall,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const FeaturedPage(),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "See All",
                                  style: TextStyle(
                                    color: MyColors.primary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // SizedBox(
                      //   height: 260,
                      //   child: ListView(
                      //     scrollDirection: Axis.horizontal,
                      //     children: const [
                      //       BookCard(
                      //         imagePath: 'assets/images/thespidy.jpg',
                      //         title: 'Sun Tzu – The Art of War',
                      //         category: 'Strategic, Fantasy',
                      //         price: 72,
                      //         rating: 4.4,
                      //       ),
                      //       BookCard(
                      //         imagePath: 'assets/images/thespidy.jpg',
                      //         title: 'Atomic Habits',
                      //         category: 'Self Help',
                      //         price: 58,
                      //         rating: 4.7,
                      //       ),
                      //       BookCard(
                      //         imagePath: 'assets/images/thespidy.jpg',
                      //         title: 'Sun Tzu – The Art of War',
                      //         category: 'Strategic, Fantasy',
                      //         price: 72,
                      //         rating: 4.4,
                      //       ),
                      //       BookCard(
                      //         imagePath: 'assets/images/thespidy.jpg',
                      //         title: 'Atomic Habits',
                      //         category: 'Self Help',
                      //         price: 58,
                      //         rating: 4.7,
                      //       ),
                      //       BookCard(
                      //         imagePath: 'assets/images/thespidy.jpg',
                      //         title: 'Sun Tzu – The Art of War',
                      //         category: 'Strategic, Fantasy',
                      //         price: 72,
                      //         rating: 4.4,
                      //       ),
                      //       BookCard(
                      //         imagePath: 'assets/images/thespidy.jpg',
                      //         title: 'Atomic Habits',
                      //         category: 'Self Help',
                      //         price: 58,
                      //         rating: 4.7,
                      //       ),
                      //       BookCard(
                      //         imagePath: 'assets/images/thespidy.jpg',
                      //         title: 'Sun Tzu – The Art of War',
                      //         category: 'Strategic, Fantasy',
                      //         price: 72,
                      //         rating: 4.4,
                      //       ),
                      //       BookCard(
                      //         imagePath: 'assets/images/thespidy.jpg',
                      //         title: 'Atomic Habits',
                      //         category: 'Self Help',
                      //         price: 58,
                      //         rating: 4.7,
                      //       ),
                      //       BookCard(
                      //         imagePath: 'assets/images/thespidy.jpg',
                      //         title: 'Sun Tzu – The Art of War',
                      //         category: 'Strategic, Fantasy',
                      //         price: 72,
                      //         rating: 4.4,
                      //       ),
                      //       BookCard(
                      //         imagePath: 'assets/images/thespidy.jpg',
                      //         title: 'Atomic Habits',
                      //         category: 'Self Help',
                      //         price: 58,
                      //         rating: 4.7,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 260,
                      //   child: FutureBuilder<QuerySnapshot>(
                      //     future: FirebaseFirestore.instance
                      //         .collection('books')
                      //         .where(
                      //           'is_featured',
                      //           isEqualTo: true,
                      //         ) // Fetch only featured books
                      //         .get(),
                      //     builder: (context, snapshot) {
                      //       if (snapshot.connectionState ==
                      //           ConnectionState.waiting) {
                      //         return const Center(
                      //           child: CircularProgressIndicator(),
                      //         );
                      //       }

                      //       if (snapshot.hasError) {
                      //         return Center(
                      //           child: Text('Error: ${snapshot.error}'),
                      //         );
                      //       }

                      //       if (!snapshot.hasData ||
                      //           snapshot.data!.docs.isEmpty) {
                      //         return const Center(
                      //           child: Text('No featured books available.'),
                      //         );
                      //       }

                      //       // Map the Firestore data into BookCards
                      //       List<QueryDocumentSnapshot> books =
                      //           snapshot.data!.docs;
                      //       return ListView(
                      //         scrollDirection: Axis.horizontal,
                      //         children: books.take(6).map((doc) {
                      //           // Only take first 6 documents
                      //           var data = doc.data() as Map<String, dynamic>;
                      //           String imageUrl =
                      //               data['cover_image_url'] ??
                      //               'assets/images/appLogo.png';
                      //           return BookCard(
                      //             imagePath: imageUrl,
                      //             title: data['title'] ?? 'No Title',
                      //             category: data['genre'] ?? 'No Category',
                      //             price: data['price'] ?? 0.0,
                      //             rating: data['rating']?.toDouble() ?? 0.0,
                      //           );
                      //         }).toList(),
                      //       );
                      //     },
                      //   ),
                      // ),
                      SizedBox(
                        height: 260,
                        child: FutureBuilder<QuerySnapshot>(
                          future: FirebaseFirestore.instance
                              .collection('books')
                              .where('is_featured', isEqualTo: true)
                              .get(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            }

                            if (!snapshot.hasData ||
                                snapshot.data!.docs.isEmpty) {
                              return const Center(
                                child: Text('No featured books available.'),
                              );
                            }

                            List<QueryDocumentSnapshot> books =
                                snapshot.data!.docs;

                            return ListView(
                              scrollDirection: Axis.horizontal,
                              children: books.take(6).map((doc) {
                                var data = doc.data() as Map<String, dynamic>;
                                String imageUrl =
                                    data['cover_image_url'] ??
                                    'assets/images/appLogo.png';
                                String bookId = doc.id;

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        opaque:
                                            false, // ✅ Important to prevent black flash
                                        pageBuilder:
                                            (
                                              context,
                                              animation,
                                              secondaryAnimation,
                                            ) => BookDetailPage(bookId: bookId),
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
                                              var tween = Tween(
                                                begin: begin,
                                                end: end,
                                              ).chain(CurveTween(curve: curve));
                                              var offsetAnimation = animation
                                                  .drive(tween);

                                              return SlideTransition(
                                                position: offsetAnimation,
                                                child: child,
                                              );
                                            },
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: bookId,
                                    child: Material(
                                      color: const Color(
                                        0xFFeeeeee,
                                      ), // ✅ Smooth transition bg
                                      child: BookCard(
                                        bookId: doc.id,
                                        imagePath: imageUrl,
                                        title: data['title'] ?? 'No Title',
                                        author: data['author'],
                                        category:
                                            data['genre'] ?? 'No Category',
                                        price: data['price']?.toDouble() ?? 0.0,
                                        rating:
                                            data['rating']?.toDouble() ?? 0.0,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular Books",
                            style: MyTextTheme.lightTextTheme.headlineSmall,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const PopularPage(),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "See All",
                                  style: TextStyle(
                                    color: MyColors.primary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                      SizedBox(
                        height: 260,
                        child: FutureBuilder<QuerySnapshot>(
                          future: FirebaseFirestore.instance
                              .collection('books')
                              .where('is_popular', isEqualTo: true)
                              .get(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            }

                            if (!snapshot.hasData ||
                                snapshot.data!.docs.isEmpty) {
                              return const Center(
                                child: Text('No popular books available.'),
                              );
                            }

                            List<QueryDocumentSnapshot> books =
                                snapshot.data!.docs;

                            return ListView(
                              scrollDirection: Axis.horizontal,
                              children: books.take(6).map((doc) {
                                var data = doc.data() as Map<String, dynamic>;
                                String imageUrl =
                                    data['cover_image_url'] ??
                                    'assets/images/appLogo.png';
                                String bookId = doc.id;

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        opaque:
                                            false, // ✅ Important to prevent black flash
                                        pageBuilder:
                                            (
                                              context,
                                              animation,
                                              secondaryAnimation,
                                            ) => BookDetailPage(bookId: bookId),
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
                                              var tween = Tween(
                                                begin: begin,
                                                end: end,
                                              ).chain(CurveTween(curve: curve));
                                              var offsetAnimation = animation
                                                  .drive(tween);

                                              return SlideTransition(
                                                position: offsetAnimation,
                                                child: child,
                                              );
                                            },
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: bookId,
                                    child: Material(
                                      color: const Color(
                                        0xFFeeeeee,
                                      ), // ✅ Smooth transition bg
                                      child: BookCard(
                                        bookId: doc.id,
                                        imagePath: imageUrl,
                                        title: data['title'] ?? 'No Title',
                                        author: data['author'],
                                        category:
                                            data['genre'] ?? 'No Category',
                                        price: data['price']?.toDouble() ?? 0.0,
                                        rating:
                                            data['rating']?.toDouble() ?? 0.0,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Best Selling Books",
                            style: MyTextTheme.lightTextTheme.headlineSmall,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const BestSellerPage(),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "See All",
                                  style: TextStyle(
                                    color: MyColors.primary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                      SizedBox(
                        height: 260,
                        child: FutureBuilder<QuerySnapshot>(
                          future: FirebaseFirestore.instance
                              .collection('books')
                              .where('is_best_selling', isEqualTo: true)
                              .get(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            }

                            if (!snapshot.hasData ||
                                snapshot.data!.docs.isEmpty) {
                              return const Center(
                                child: Text('No best selling books available.'),
                              );
                            }

                            List<QueryDocumentSnapshot> books =
                                snapshot.data!.docs;

                            return ListView(
                              scrollDirection: Axis.horizontal,
                              children: books.take(6).map((doc) {
                                var data = doc.data() as Map<String, dynamic>;
                                String imageUrl =
                                    data['cover_image_url'] ??
                                    'assets/images/appLogo.png';
                                String bookId = doc.id;

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        opaque:
                                            false, // ✅ Important to prevent black flash
                                        pageBuilder:
                                            (
                                              context,
                                              animation,
                                              secondaryAnimation,
                                            ) => BookDetailPage(bookId: bookId),
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
                                              var tween = Tween(
                                                begin: begin,
                                                end: end,
                                              ).chain(CurveTween(curve: curve));
                                              var offsetAnimation = animation
                                                  .drive(tween);

                                              return SlideTransition(
                                                position: offsetAnimation,
                                                child: child,
                                              );
                                            },
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: bookId,
                                    child: Material(
                                      color: const Color(
                                        0xFFeeeeee,
                                      ), // ✅ Smooth transition bg
                                      child: BookCard(
                                        bookId: doc.id,
                                        imagePath: imageUrl,
                                        title: data['title'] ?? 'No Title',
                                        author: data['author'],
                                        category:
                                            data['genre'] ?? 'No Category',
                                        price: data['price']?.toDouble() ?? 0.0,
                                        rating:
                                            data['rating']?.toDouble() ?? 0.0,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Explore Our All Books",
                            style: MyTextTheme.lightTextTheme.headlineSmall,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const AllBooksPage(),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "See All",
                                  style: TextStyle(
                                    color: MyColors.primary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                      SizedBox(
                        height: 260,
                        child: FutureBuilder<QuerySnapshot>(
                          future: FirebaseFirestore.instance
                              .collection('books')
                              .get(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            }

                            if (!snapshot.hasData ||
                                snapshot.data!.docs.isEmpty) {
                              return const Center(
                                child: Text('No books available.'),
                              );
                            }

                            List<QueryDocumentSnapshot> books =
                                snapshot.data!.docs;

                            return ListView(
                              scrollDirection: Axis.horizontal,
                              children: books.take(6).map((doc) {
                                var data = doc.data() as Map<String, dynamic>;
                                String imageUrl =
                                    data['cover_image_url'] ??
                                    'assets/images/appLogo.png';
                                String bookId = doc.id;

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        opaque:
                                            false, // ✅ Important to prevent black flash
                                        pageBuilder:
                                            (
                                              context,
                                              animation,
                                              secondaryAnimation,
                                            ) => BookDetailPage(bookId: bookId),
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
                                              var tween = Tween(
                                                begin: begin,
                                                end: end,
                                              ).chain(CurveTween(curve: curve));
                                              var offsetAnimation = animation
                                                  .drive(tween);

                                              return SlideTransition(
                                                position: offsetAnimation,
                                                child: child,
                                              );
                                            },
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: bookId,
                                    child: Material(
                                      color: const Color(
                                        0xFFeeeeee,
                                      ), // ✅ Smooth transition bg
                                      child: BookCard(
                                        bookId: doc.id,
                                        imagePath: imageUrl,
                                        title: data['title'] ?? 'No Title',
                                        author: data['author'],
                                        category:
                                            data['genre'] ?? 'No Category',
                                        price: data['price']?.toDouble() ?? 0.0,
                                        rating:
                                            data['rating']?.toDouble() ?? 0.0,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 30),
                    ],
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
