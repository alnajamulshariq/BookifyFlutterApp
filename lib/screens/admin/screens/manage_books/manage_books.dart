// import 'package:bookify/screens/admin/screens/manage_books/add_books.dart';
// import 'package:bookify/screens/admin/screens/manage_books/edit_books.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:bookify/screens/auth/users/sign_in.dart';
// import 'package:bookify/utils/constants/colors.dart';
// import 'package:bookify/utils/themes/custom_themes/adminbottomnavbar.dart';
// import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ManageBooks extends StatefulWidget {
//   const ManageBooks({super.key});

//   @override
//   State<ManageBooks> createState() => _ManageBooksState();
// }

// class _ManageBooksState extends State<ManageBooks> {
//   final auth = FirebaseAuth.instance;
//   bool _showSearchBar = false;
//   final TextEditingController _searchController = TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(
//       _searchBooks,
//     ); // Listen to search text changes
//   }

//   void _searchBooks() {
//     setState(() {}); // Rebuild when search text changes
//   }

//   String selectedCategory = 'All Books';

//   final List<String> categories = [
//     'All Books',
//     'Featured',
//     'Popular',
//     'Best Selling',
//     'Novels',
//     'Self Love',
//     'Science',
//     'Romance',
//     'History',
//     'Fantasy',
//     'Poetry',
//     'Action',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFeeeeee),
//       bottomNavigationBar: buildAdminCurvedNavBar(context, 1),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           // Wrap entire body to allow scrolling
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 30),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Row(
//                   children: [
//                     ClipOval(
//                       child: Image.asset(
//                         "assets/images/b.jpg",
//                         width: 40,
//                         height: 40,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Hi, Schariq",
//                           style: MyTextTheme.lightTextTheme.titleLarge,
//                         ),
//                         const Text(
//                           "Administrator",
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Spacer(),
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           _showSearchBar = !_showSearchBar;
//                         });
//                       },
//                       child: Icon(
//                         Icons.search_rounded,
//                         color: MyColors.primary,
//                         size: 30,
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     InkWell(
//                       onTap: () {
//                         auth.signOut().then((value) {
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const SignIn(),
//                             ),
//                           );
//                         });
//                       },
//                       child: Icon(
//                         Icons.logout,
//                         color: MyColors.primary,
//                         size: 30,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               if (_showSearchBar)
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
//                   child: TextField(
//                     controller: _searchController,
//                     style: const TextStyle(color: Colors.black),
//                     decoration: InputDecoration(
//                       hintText: "Search...",
//                       hintStyle: const TextStyle(color: Colors.grey),
//                       prefixIcon: const Icon(Icons.search, color: Colors.grey),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                   ),
//                 ),
//               const SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 12,
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16),
//                     border: Border.all(color: Colors.teal.shade200),
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Colors.tealAccent,
//                         blurRadius: 4,
//                         offset: Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 8),
//                           child: Text(
//                             "Manage Books",
//                             style: TextStyle(
//                               color: MyColors.primary,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 8),
//                           child: InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => AddBooks(),
//                                 ),
//                               );
//                             },
//                             child: Icon(
//                               Icons.add_circle_rounded,
//                               size: 40,
//                               color: Colors.teal,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: SizedBox(
//                   height: 45,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: categories.length,
//                     itemBuilder: (context, index) {
//                       bool isSelected =
//                           selectedCategory ==
//                           categories[index]; // Check if the category is selected

//                       return Padding(
//                         padding: const EdgeInsets.only(right: 10),
//                         child: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               selectedCategory =
//                                   categories[index]; // Update the selected category
//                             });
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 16,
//                               vertical: 10,
//                             ),
//                             decoration: BoxDecoration(
//                               color: isSelected
//                                   ? Colors.teal
//                                   : const Color.fromARGB(
//                                       129,
//                                       178,
//                                       223,
//                                       219,
//                                     ), // Change color if selected
//                               borderRadius: BorderRadius.circular(25),
//                               // Removed the border property to eliminate the outline
//                             ),
//                             child: Text(
//                               categories[index],
//                               style: TextStyle(
//                                 color: isSelected
//                                     ? Colors.white
//                                     : MyColors
//                                           .primary, // Change text color if selected
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),

//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection('books')
//                       .snapshots(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(child: CircularProgressIndicator());
//                     }
//                     if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                       return const Center(child: Text('No books found.'));
//                     }

//                     final books = snapshot.data!.docs;

//                     // Apply filtering based on the selected category
//                     final filteredBooks = selectedCategory == 'All Books'
//                         ? books
//                         : books.where((doc) {
//                             final genre =
//                                 doc['genre']?.toString().toLowerCase() ?? '';
//                             bool isCategoryMatch =
//                                 genre == selectedCategory.toLowerCase();

//                             // Additional filtering for categories like 'Featured', 'Best Selling', 'Popular'
//                             if (selectedCategory == 'Featured') {
//                               return doc['is_featured'] == true;
//                             }
//                             if (selectedCategory == 'Best Selling') {
//                               return doc['is_best_selling'] == true;
//                             }
//                             if (selectedCategory == 'Popular') {
//                               return doc['is_popular'] == true;
//                             }

//                             return isCategoryMatch;
//                           }).toList();

//                     if (filteredBooks.isEmpty) {
//                       return const Center(
//                         child: Text(
//                           'No books found in this category.',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       );
//                     }

//                     return Column(
//                       children: filteredBooks.map((doc) {
//                         final data = doc.data() as Map<String, dynamic>;

//                         return Dismissible(
//                           key: Key(doc.id), // Unique key for each item
//                           direction: DismissDirection
//                               .horizontal, // Allow swipe in both directions
//                           background: Container(
//                             color: Colors.red, // Color for swipe left (Edit)
//                             alignment: Alignment.centerLeft,
//                             child: const Padding(
//                               padding: EdgeInsets.only(left: 20),
//                               child: Icon(Icons.delete, color: Colors.white),
//                             ),
//                           ),
//                           secondaryBackground: Container(
//                             color:
//                                 Colors.teal, // Color for swipe right (Delete)
//                             alignment: Alignment.centerRight,
//                             child: const Padding(
//                               padding: EdgeInsets.only(right: 20),
//                               child: Icon(Icons.edit, color: Colors.white),
//                             ),
//                           ),
//                           confirmDismiss: (direction) async {
//                             if (direction == DismissDirection.endToStart) {
//                               // Edit action (swiped from right to left)
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) =>
//                                       EditBooks(bookId: doc.id, bookData: data),
//                                 ),
//                               );
//                               return false; // Don't dismiss immediately (navigate first)
//                             } else if (direction ==
//                                 DismissDirection.startToEnd) {
//                               // Delete action (swiped from left to right)
//                               await FirebaseFirestore.instance
//                                   .collection('books')
//                                   .doc(doc.id)
//                                   .delete();

//                               // Show Snackbar to confirm delete
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text('Book deleted successfully!'),
//                                   duration: Duration(seconds: 2),
//                                 ),
//                               );

//                               return true; // Allow dismissal after deletion
//                             }
//                             return false; // Ensure swipe completes
//                           },
//                           child: Card(
//                             color: Colors.white, // Set the card color to white
//                             margin: const EdgeInsets.symmetric(
//                               vertical: 8.0,
//                               horizontal: 12.0,
//                             ),
//                             elevation:
//                                 5, // Add some shadow for a card-like effect
//                             child: Padding(
//                               padding: const EdgeInsets.all(12.0),
//                               child: Row(
//                                 children: [
//                                   // Book Image
//                                   data['cover_image_url'] != null
//                                       ? Image.network(
//                                           data['cover_image_url'],
//                                           width: 50,
//                                           height: 50,
//                                         )
//                                       : const Icon(Icons.broken_image),
//                                   const SizedBox(width: 12),
//                                   // Book Details
//                                   Flexible(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           data['title'] ?? '',
//                                           style: const TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: MyColors.primary,
//                                             fontSize: 16,
//                                           ),
//                                         ),
//                                         const SizedBox(height: 4),
//                                         Text(
//                                           data['genre'] ?? '',
//                                           style: TextStyle(color: Colors.teal),
//                                         ),
//                                         const SizedBox(height: 4),
//                                         Text(
//                                           '\$${data['price'] ?? ''}',
//                                           style: TextStyle(
//                                             color: Colors.deepOrange,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   // Removed Edit and Delete buttons here
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:bookify/screens/admin/screens/manage_books/add_books.dart';
import 'package:bookify/screens/admin/screens/manage_books/edit_books.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bookify/screens/auth/users/sign_in.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/adminbottomnavbar.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManageBooks extends StatefulWidget {
  const ManageBooks({super.key});

  @override
  State<ManageBooks> createState() => _ManageBooksState();
}

class _ManageBooksState extends State<ManageBooks> {
  final auth = FirebaseAuth.instance;
  bool _showSearchBar = false;
  final TextEditingController _searchController = TextEditingController();
  List<QueryDocumentSnapshot> allBooks = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_searchBooks);
  }

  void _searchBooks() {
    setState(() {}); // Rebuild when search text changes
  }

  String selectedCategory = 'All Books';

  final List<String> categories = [
    'All Books',
    'Featured',
    'Popular',
    'Best Selling',
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeeeeee),
      bottomNavigationBar: buildAdminCurvedNavBar(context, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          // Wrap entire body to allow scrolling
          child: Column(
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
                          "Hi, Schariq",
                          style: MyTextTheme.lightTextTheme.titleLarge,
                        ),
                        const Text(
                          "Administrator",
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.teal.shade200),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.tealAccent,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            "Manage Books",
                            style: TextStyle(
                              color: MyColors.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddBooks(),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.add_circle_rounded,
                              size: 40,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  height: 45,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      bool isSelected = selectedCategory == categories[index];

                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory = categories[index];
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.teal
                                  : const Color.fromARGB(129, 178, 223, 219),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : MyColors.primary,
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
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('books')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text('No books found.'));
                    }

                    final books = snapshot.data!.docs;
                    final filteredBooks = _searchController.text.isEmpty
                        ? books
                        : books.where((doc) {
                            final title = doc['title'].toString().toLowerCase();
                            return title.contains(
                              _searchController.text.toLowerCase(),
                            );
                          }).toList();

                    if (filteredBooks.isEmpty) {
                      return const Center(child: Text('No books found.'));
                    }

                    return Column(
                      children: filteredBooks.map((doc) {
                        final data = doc.data() as Map<String, dynamic>;

                        return Dismissible(
                          key: Key(doc.id),
                          direction: DismissDirection.horizontal,
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerLeft,
                            child: const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Icon(Icons.delete, color: Colors.white),
                            ),
                          ),
                          secondaryBackground: Container(
                            color: Colors.teal,
                            alignment: Alignment.centerRight,
                            child: const Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Icon(Icons.edit, color: Colors.white),
                            ),
                          ),
                          confirmDismiss: (direction) async {
                            if (direction == DismissDirection.endToStart) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EditBooks(bookId: doc.id, bookData: data),
                                ),
                              );
                              return false;
                            } else if (direction ==
                                DismissDirection.startToEnd) {
                              await FirebaseFirestore.instance
                                  .collection('books')
                                  .doc(doc.id)
                                  .delete();

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Book deleted successfully!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );

                              return true;
                            }
                            return false;
                          },
                          child: Card(
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 12.0,
                            ),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  data['cover_image_url'] != null
                                      ? Image.network(
                                          data['cover_image_url'],
                                          width: 50,
                                          height: 50,
                                        )
                                      : const Icon(Icons.broken_image),
                                  const SizedBox(width: 12),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data['title'] ?? '',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: MyColors.primary,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          data['genre'] ?? '',
                                          style: TextStyle(color: Colors.teal),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '\$${data['price'] ?? ''}',
                                          style: TextStyle(
                                            color: Colors.deepOrange,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
