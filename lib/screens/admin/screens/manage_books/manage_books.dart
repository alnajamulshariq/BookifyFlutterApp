// // import 'package:bookify/screens/auth/users/sign_in.dart';
// // import 'package:bookify/utils/constants/colors.dart';
// // import 'package:bookify/utils/themes/custom_themes/adminbottomnavbar.dart';
// // import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';

// // class ManageBooks extends StatefulWidget {
// //   const ManageBooks({super.key});

// //   @override
// //   State<ManageBooks> createState() => _ManageBooksState();
// // }

// // class _ManageBooksState extends State<ManageBooks> {
// //   final auth = FirebaseAuth.instance;
// //   bool _showSearchBar = false;
// //   final TextEditingController _searchController = TextEditingController();
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Color(0xFFeeeeee),
// //       bottomNavigationBar: buildAdminCurvedNavBar(context, 1),
// //       body: SafeArea(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             const SizedBox(height: 30),
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 24.0),
// //               child: Row(
// //                 children: [
// //                   ClipOval(
// //                     child: Image.asset(
// //                       "assets/images/b.jpg",
// //                       width: 40,
// //                       height: 40,
// //                       fit: BoxFit.cover,
// //                     ),
// //                   ),
// //                   const SizedBox(width: 10),
// //                   Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         "Hi, Schariq",
// //                         style: MyTextTheme.lightTextTheme.titleLarge,
// //                       ),
// //                       const Text(
// //                         "Administrator",
// //                         style: TextStyle(
// //                           color: Colors.grey,
// //                           fontSize: 12,
// //                           fontWeight: FontWeight.w500,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   const Spacer(),
// //                   InkWell(
// //                     onTap: () {
// //                       setState(() {
// //                         _showSearchBar = !_showSearchBar;
// //                       });
// //                     },
// //                     child: Icon(
// //                       Icons.search_rounded,
// //                       color: MyColors.primary,
// //                       size: 30,
// //                     ),
// //                   ),
// //                   const SizedBox(width: 10),
// //                   InkWell(
// //                     onTap: () {
// //                       auth.signOut().then((value) {
// //                         Navigator.pushReplacement(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (context) => const SignIn(),
// //                           ),
// //                         );
// //                       });
// //                     },
// //                     child: Icon(
// //                       Icons.logout,
// //                       color: MyColors.primary,
// //                       size: 30,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             if (_showSearchBar)
// //               Padding(
// //                 padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
// //                 child: TextField(
// //                   controller: _searchController,
// //                   style: const TextStyle(color: Colors.black),
// //                   decoration: InputDecoration(
// //                     hintText: "Search...",
// //                     hintStyle: const TextStyle(color: Colors.grey),
// //                     prefixIcon: const Icon(Icons.search, color: Colors.grey),
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(12),
// //                     ),
// //                     filled: true,
// //                     fillColor: Colors.white,
// //                   ),
// //                 ),
// //               ),
// //             const SizedBox(height: 30),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:bookify/screens/admin/screens/manage_books/add_books.dart';
// import 'package:bookify/screens/admin/screens/manage_books/edit_books.dart';
// // import 'package:bookify/screens/admin/screens/manage_books/manage_action/view_action.dart';
// // import 'package:bookify/screens/admin/screens/manage_books/manage_all_books/view_all_books.dart';
// // import 'package:bookify/screens/admin/screens/manage_books/manage_best_selling_books/view_best_selling.dart';
// // import 'package:bookify/screens/admin/screens/manage_books/manage_fantasy/view_fantasy.dart';
// // import 'package:bookify/screens/admin/screens/manage_books/manage_featured_books/view_featured.dart';
// // import 'package:bookify/screens/admin/screens/manage_books/manage_history/view_history.dart';
// // import 'package:bookify/screens/admin/screens/manage_books/manage_novels/view_novels.dart';
// // import 'package:bookify/screens/admin/screens/manage_books/manage_poetry/view_poetry.dart';
// // import 'package:bookify/screens/admin/screens/manage_books/manage_popular_books/view_popular.dart';
// // import 'package:bookify/screens/admin/screens/manage_books/manage_romance/view_romance.dart';
// // import 'package:bookify/screens/admin/screens/manage_books/manage_science/view_science.dart';
// // import 'package:bookify/screens/admin/screens/manage_books/manage_self_love/view_self_love.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:bookify/screens/auth/users/sign_in.dart';
// import 'package:bookify/utils/constants/colors.dart';
// import 'package:bookify/utils/themes/custom_themes/adminbottomnavbar.dart';
// import 'package:bookify/utils/themes/custom_themes/text_theme.dart';

// class ManageBooks extends StatefulWidget {
//   const ManageBooks({super.key});

//   @override
//   State<ManageBooks> createState() => _ManageBooksState();
// }

// class _ManageBooksState extends State<ManageBooks> {
//   final auth = FirebaseAuth.instance;
//   bool _showSearchBar = false;
//   final TextEditingController _searchController = TextEditingController();
//   String selectedCategory = 'Featured Books'; // Default category

//   String? selectedValue;
//   // Categories to be displayed in the dropdown
//   final List<String> categories = [
//     'Featured Books',
//     'Popular Books',
//     'Best Selling Books',
//     'Novels',
//     'Self Love',
//     'Science',
//     'Romance',
//     'History',
//     'Fantasy',
//     'Poetry',
//     'Action',
//     'All Books',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFeeeeee),
//       bottomNavigationBar: buildAdminCurvedNavBar(context, 1),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
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
//                         "Hi, Schariq",
//                         style: MyTextTheme.lightTextTheme.titleLarge,
//                       ),
//                       const Text(
//                         "Administrator",
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
//                           MaterialPageRoute(
//                             builder: (context) => const SignIn(),
//                           ),
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
//             const SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                   border: Border.all(color: Colors.teal.shade200),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.tealAccent,
//                       blurRadius: 4,
//                       offset: Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 8),
//                         child: Text(
//                           "Manage Books",
//                           style: TextStyle(
//                             color: MyColors.primary,
//                             fontSize: 20,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 8),
//                         child: InkWell(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => AddBooks(),
//                               ),
//                             );
//                           },
//                           child: Icon(
//                             Icons.add_circle_rounded,
//                             size: 40,
//                             color: Colors.teal,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: SizedBox(
//                 height: 45,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: categories.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 10),
//                       child: GestureDetector(
//                         onTap: () => navigateToCategoryView(categories[index]),
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

//             const SizedBox(height: 30),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Table(
//                 border: TableBorder.all(color: MyColors.primary),
//                 children: [
//                   // Header row
//                   TableRow(
//                     decoration: BoxDecoration(color: Colors.teal),
//                     children: [
//                       TableCell(
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 4),
//                           child: Center(
//                             child: Text(
//                               'Title',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ),
//                       TableCell(
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 4),
//                           child: Center(
//                             child: Text(
//                               'Type',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ),
//                       TableCell(
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 4),
//                           child: Center(
//                             child: Text(
//                               'Price',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ),
//                       TableCell(
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 4),
//                           child: Center(
//                             child: Text(
//                               'Image',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ),
//                       TableCell(
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 4),
//                           child: Center(
//                             child: Text(
//                               'Action',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   // Data rows (hardcoded)
//                   TableRow(
//                     children: [
//                       TableCell(
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 14),
//                           child: Center(
//                             child: Text(
//                               'Book 1',
//                               style: TextStyle(color: Colors.teal),
//                             ),
//                           ),
//                         ),
//                       ),
//                       TableCell(
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 14),
//                           child: Center(
//                             child: Text(
//                               'Fiction',
//                               style: TextStyle(color: Colors.teal),
//                             ),
//                           ),
//                         ),
//                       ),
//                       TableCell(
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 14),
//                           child: Center(
//                             child: Text(
//                               '\$10.99',
//                               style: TextStyle(color: Colors.teal),
//                             ),
//                           ),
//                         ),
//                       ),

//                       TableCell(
//                         child: Center(
//                           child: Container(
//                             width: 50,
//                             height: 50,
//                             color: Colors.teal, // Placeholder for image
//                           ),
//                         ),
//                       ),
//                       TableCell(
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 14),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 4),
//                                 child: InkWell(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => EditBooks(),
//                                       ),
//                                     );
//                                   },
//                                   child: Icon(Icons.edit, color: Colors.teal),
//                                 ),
//                               ),

//                               Padding(
//                                 padding: const EdgeInsets.only(right: 4),
//                                 child: Icon(Icons.delete, color: Colors.red),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Function to navigate to the selected category view page
//   void navigateToCategoryView(String category) {
//     Widget categoryViewPage;

//     switch (category) {
//       case 'Featured Books':
//         // categoryViewPage = ViewFeaturedBooks();
//         break;
//       case 'Popular Books':
//         // categoryViewPage = ViewPopularBooks();
//         break;
//       case 'Best Selling Books':
//         // categoryViewPage = ViewBestSellingBooks();
//         break;
//       case 'Novels':
//         // categoryViewPage = ViewNovelsBooks();
//         break;
//       case 'Self Love':
//         // categoryViewPage = ViewSelfLoveBooks();
//         break;
//       case 'Science':
//         // categoryViewPage = ViewScienceBooks();
//         break;
//       case 'Romance':
//         // categoryViewPage = ViewRomanceBooks();
//         break;
//       case 'History':
//         // categoryViewPage = ViewHistoryBooks();
//         break;
//       case 'Fantasy':
//         // categoryViewPage = ViewFantasyBooks();
//         break;
//       case 'Poetry':
//         // categoryViewPage = ViewPoetryBooks();
//         break;
//       case 'Action':
//         // categoryViewPage = ViewActionBooks();
//         break;
//       case 'All Books':
//         // categoryViewPage = ViewAllBooks();
//         break;
//       default:
//       // categoryViewPage = ViewFeaturedBooks(); // Default category view
//     }

//     // Navigator.push(
//     //   context,
//     //   MaterialPageRoute(builder: (context) => categoryViewPage),
//     // );
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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

                  // Apply filtering based on the selected category
                  final filteredBooks = selectedCategory == 'All Books'
                      ? books
                      : books.where((doc) {
                          final genre =
                              doc['genre']?.toString().toLowerCase() ?? '';
                          bool isCategoryMatch =
                              genre == selectedCategory.toLowerCase();

                          // Additional filtering for categories like 'Featured', 'Best Selling', 'Popular'
                          if (selectedCategory == 'Featured') {
                            return doc['is_featured'] == true;
                          }
                          if (selectedCategory == 'Best Selling') {
                            return doc['is_best_selling'] == true;
                          }
                          if (selectedCategory == 'Popular') {
                            return doc['is_popular'] == true;
                          }

                          return isCategoryMatch;
                        }).toList();

                  if (filteredBooks.isEmpty) {
                    return const Center(
                      child: Text(
                        'No books found in this category.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }

                  return Container(
                    height:
                        MediaQuery.of(context).size.height *
                        0.5, // Adjust this value as needed
                    decoration: BoxDecoration(
                      border: Border.all(color: MyColors.primary),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Table(
                        border: TableBorder.all(color: MyColors.primary),
                        columnWidths: const {
                          0: FlexColumnWidth(2),
                          1: FlexColumnWidth(2),
                          2: FlexColumnWidth(1.5),
                          3: FlexColumnWidth(2),
                          4: FlexColumnWidth(2),
                        },
                        children: [
                          TableRow(
                            decoration: const BoxDecoration(color: Colors.teal),
                            children: const [
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Center(
                                    child: Text(
                                      'Title',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Center(
                                    child: Text(
                                      'Type',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Center(
                                    child: Text(
                                      'Price',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Center(
                                    child: Text(
                                      'Image',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Center(
                                    child: Text(
                                      'Action',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ...filteredBooks.map((doc) {
                            final data = doc.data() as Map<String, dynamic>;
                            return TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 14),
                                    child: Center(
                                      child: Text(
                                        data['title'] ?? '',
                                        style: const TextStyle(
                                          color: Colors.teal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 14),
                                    child: Center(
                                      child: Text(
                                        data['genre'] ?? '',
                                        style: const TextStyle(
                                          color: Colors.teal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 14),
                                    child: Center(
                                      child: Text(
                                        '\$${data['price'] ?? ''}',
                                        style: const TextStyle(
                                          color: Colors.teal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Center(
                                    child: data['cover_image_url'] != null
                                        ? Image.network(
                                            data['cover_image_url'],
                                            width: 50,
                                            height: 50,
                                          )
                                        : const Icon(Icons.broken_image),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 14),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 4,
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditBooks(
                                                        bookId: doc.id,
                                                        bookData: data,
                                                      ),
                                                ),
                                              );
                                            },
                                            child: const Icon(
                                              Icons.edit,
                                              color: Colors.teal,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 4,
                                          ),
                                          child: InkWell(
                                            onTap: () async {
                                              await FirebaseFirestore.instance
                                                  .collection('books')
                                                  .doc(doc.id)
                                                  .delete();
                                            },
                                            child: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
