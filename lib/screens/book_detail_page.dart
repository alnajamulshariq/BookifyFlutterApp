// import 'package:bookify/screens/auth/users/sign_in.dart';
// import 'package:bookify/utils/constants/colors.dart';
// import 'package:bookify/utils/themes/custom_themes/app_navbar.dart';
// import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class BookDetailPage extends StatefulWidget {
//   final Map<String, dynamic> book;

//   const BookDetailPage({super.key, required this.book});

//   @override
//   State<BookDetailPage> createState() => _BookDetailPageState();
// }

// class _BookDetailPageState extends State<BookDetailPage> {
//   final auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     final book = widget.book;

//     return Scaffold(
//       backgroundColor: const Color(0xFFeeeeee),
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(height: 30),
//             const CustomNavBar(),

//             const SizedBox(height: 10),

//             /// Scrollable Detail Content
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Book Image
//                     Center(
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(16),
//                         child: Image.asset(
//                           book['imagePath'],
//                           width: 200,
//                           height: 280,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 24),

//                     // Title
//                     Text(
//                       book['title'],
//                       style: MyTextTheme.lightTextTheme.headlineMedium,
//                     ),

//                     const SizedBox(height: 6),

//                     // ✅ Author
//                     if (book.containsKey('author'))
//                       Text(
//                         "By ${book['author']}",
//                         style: const TextStyle(
//                           color: Colors.black87,
//                           fontSize: 15,
//                           fontStyle: FontStyle.italic,
//                         ),
//                       ),

//                     const SizedBox(height: 8),

//                     // Category
//                     Text(
//                       book['category'],
//                       style: const TextStyle(color: Colors.teal, fontSize: 16),
//                     ),

//                     const SizedBox(height: 16),

//                     // Price & Rating
//                     Row(
//                       children: [
//                         Text(
//                           "\$${book['price']}",
//                           style: const TextStyle(
//                             color: MyColors.primary,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         Row(
//                           children: [
//                             const Icon(Icons.star, color: Colors.amber),
//                             const SizedBox(width: 4),
//                             Text(
//                               book['rating'].toString(),
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.deepOrange,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 24),

//                     // Description
//                     const Text(
//                       "Description",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                         color: MyColors.primary,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     const Text(
//                       "This is a placeholder book description. You can fetch and show dynamic descriptions from Firebase.",
//                       style: TextStyle(fontSize: 15, color: Colors.teal),
//                     ),

//                     const SizedBox(height: 32),

//                     // Add to Cart Button
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: MyColors.primary,
//                           padding: const EdgeInsets.symmetric(vertical: 14),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         onPressed: () {
//                           // Add to cart logic here
//                         },
//                         child: const Text(
//                           "Add to Cart",
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:bookify/screens/auth/users/sign_in.dart';
// import 'package:bookify/utils/constants/colors.dart';
// import 'package:bookify/utils/themes/custom_themes/app_navbar.dart';
// import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class BookDetailPage extends StatefulWidget {
//   final String bookId;

//   const BookDetailPage({super.key, required this.bookId});

//   @override
//   State<BookDetailPage> createState() => _BookDetailPageState();
// }

// class _BookDetailPageState extends State<BookDetailPage> {
//   final auth = FirebaseAuth.instance;
//   DocumentSnapshot? bookData; // Make it nullable

//   @override
//   void initState() {
//     super.initState();
//     fetchBookData();
//   }

//   // Fetch book details from Firestore
//   Future<void> fetchBookData() async {
//     try {
//       DocumentSnapshot snapshot = await FirebaseFirestore.instance
//           .collection('books')
//           .doc(widget.bookId)
//           .get();

//       if (snapshot.exists) {
//         setState(() {
//           bookData = snapshot;
//         });
//       } else {
//         print("Book not found");
//       }
//     } catch (e) {
//       print("Error fetching book data: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Show loader until bookData is fetched
//     if (bookData == null) {
//       return const Scaffold(
//         backgroundColor: Color(0xFFeeeeee), // ✅ Match this color
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }

//     // Get book details safely
//     final book = bookData!.data() as Map<String, dynamic>;

//     return Scaffold(
//       backgroundColor: const Color(0xFFeeeeee),
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(height: 30),
//             const CustomNavBar(),
//             const SizedBox(height: 10),

//             /// Scrollable Detail Content
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Center(
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(16),
//                         child: book['cover_image_url'] != null
//                             ? Image.network(
//                                 book['cover_image_url'],
//                                 width: 200,
//                                 height: 280,
//                                 fit: BoxFit.cover,
//                               )
//                             : const Image(
//                                 image: AssetImage(
//                                   'assets/images/default_cover.jpg',
//                                 ),
//                                 width: 200,
//                                 height: 280,
//                                 fit: BoxFit.cover,
//                               ),
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     Text(
//                       book['title'] ?? 'No Title',
//                       style: MyTextTheme.lightTextTheme.headlineMedium,
//                     ),
//                     const SizedBox(height: 6),
//                     if (book.containsKey('author'))
//                       Text(
//                         "By ${book['author']}",
//                         style: const TextStyle(
//                           color: Colors.black87,
//                           fontSize: 15,
//                           fontStyle: FontStyle.italic,
//                         ),
//                       ),
//                     const SizedBox(height: 8),
//                     Text(
//                       book['genre'] ?? 'Unknown',
//                       style: const TextStyle(color: Colors.teal, fontSize: 16),
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       children: [
//                         Text(
//                           "\$${book['price'] ?? 0}",
//                           style: const TextStyle(
//                             color: MyColors.primary,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         Row(
//                           children: [
//                             const Icon(Icons.star, color: Colors.amber),
//                             const SizedBox(width: 4),
//                             Text(
//                               book['rating']?.toString() ?? '0.0',
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.deepOrange,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 24),
//                     const Text(
//                       "Description",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                         color: MyColors.primary,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       book['description'] ?? "No description available.",
//                       style: const TextStyle(fontSize: 15, color: Colors.teal),
//                     ),
//                     const SizedBox(height: 32),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: MyColors.primary,
//                           padding: const EdgeInsets.symmetric(vertical: 14),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         onPressed: () {
//                           // Add to cart logic here
//                         },
//                         child: const Text(
//                           "Add to Cart",
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:bookify/models/cart_item.dart';
import 'package:bookify/managers/cart_manager.dart';
import 'package:bookify/screens/cart.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/app_navbar.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookDetailPage extends StatefulWidget {
  final String bookId;

  const BookDetailPage({super.key, required this.bookId});

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  final auth = FirebaseAuth.instance;
  DocumentSnapshot? bookData;

  @override
  void initState() {
    super.initState();
    fetchBookData();
  }

  Future<void> fetchBookData() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('books')
          .doc(widget.bookId)
          .get();

      if (snapshot.exists) {
        setState(() {
          bookData = snapshot;
        });
      } else {
        print("Book not found");
      }
    } catch (e) {
      print("Error fetching book data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (bookData == null) {
      return const Scaffold(
        backgroundColor: Color(0xFFeeeeee),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final book = bookData!.data() as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: const Color(0xFFeeeeee),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const CustomNavBar(),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: book['cover_image_url'] != null
                            ? Image.network(
                                book['cover_image_url'],
                                width: 200,
                                height: 280,
                                fit: BoxFit.cover,
                              )
                            : const Image(
                                image: AssetImage(
                                  'assets/images/default_cover.jpg',
                                ),
                                width: 200,
                                height: 280,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      book['title'] ?? 'No Title',
                      style: MyTextTheme.lightTextTheme.headlineMedium,
                    ),
                    const SizedBox(height: 6),
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
                    Text(
                      book['genre'] ?? 'Unknown',
                      style: const TextStyle(color: Colors.teal, fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          "\$${book['price'] ?? 0}",
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
                              book['rating']?.toString() ?? '0.0',
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
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: MyColors.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      book['description'] ?? "No description available.",
                      style: const TextStyle(fontSize: 15, color: Colors.teal),
                    ),
                    const SizedBox(height: 32),

                    /// ✅ Add to Cart Button
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
                          final item = CartItem(
                            bookId: widget
                                .bookId, // ✅ required for Firestore doc ID
                            title: book['title'] ?? 'No Title',
                            author: book['author'] ?? 'Unknown',
                            imageUrl: book['cover_image_url'] ?? '',
                            price: (book['price'] is int)
                                ? (book['price'] as int).toDouble()
                                : (book['price'] ?? 0.0),
                          );

                          CartManager.addToCart(item);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${item.title} added to cart'),
                            ),
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CartScreen(),
                            ),
                          );
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
