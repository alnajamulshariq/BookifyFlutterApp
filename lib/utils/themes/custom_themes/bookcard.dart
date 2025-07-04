// // import 'package:bookify/utils/constants/colors.dart';
// // import 'package:flutter/material.dart';

// // class BookCard extends StatefulWidget {
// //   final String imagePath;
// //   final String title;
// //   final String category;
// //   final double price;
// //   final double rating;

// //   const BookCard({
// //     super.key,
// //     required this.imagePath,
// //     required this.title,
// //     required this.category,
// //     required this.price,
// //     required this.rating,
// //   });

// //   @override
// //   State<BookCard> createState() => _BookCardState();
// // }

// // class _BookCardState extends State<BookCard> {
// //   bool isFavorited = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: 150,
// //       margin: const EdgeInsets.only(right: 12),
// //       padding: const EdgeInsets.all(8),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(12),
// //         boxShadow: [
// //           BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // Book Image with Favorite icon
// //           Stack(
// //             children: [
// //               ClipRRect(
// //                 borderRadius: BorderRadius.circular(8),
// //                 child: Image.network(
// //                   widget.imagePath,
// //                   height: 160,
// //                   width: double.infinity,
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //               Positioned(
// //                 top: 6,
// //                 right: 6,
// //                 child: GestureDetector(
// //                   onTap: () {
// //                     setState(() {
// //                       isFavorited = !isFavorited;
// //                     });
// //                   },
// //                   child: Container(
// //                     padding: const EdgeInsets.all(4),
// //                     decoration: const BoxDecoration(
// //                       color: Colors.white,
// //                       shape: BoxShape.circle,
// //                     ),
// //                     child: Icon(
// //                       isFavorited ? Icons.favorite : Icons.favorite_border,
// //                       size: 18,
// //                       color: isFavorited ? Colors.red : Colors.grey,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),

// //           const SizedBox(height: 8),

// //           // Title
// //           Text(
// //             widget.title,
// //             maxLines: 1,
// //             overflow: TextOverflow.ellipsis,
// //             style: const TextStyle(
// //               fontWeight: FontWeight.w600,
// //               fontSize: 14,
// //               color: Colors.deepOrange,
// //             ),
// //           ),

// //           // Category
// //           Text(
// //             widget.category,
// //             style: const TextStyle(fontSize: 12, color: Colors.black),
// //           ),

// //           const SizedBox(height: 6),

// //           // Price & Rating + Cart
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               // Left: Price
// //               Text(
// //                 '\$${widget.price.toStringAsFixed(0)}',
// //                 style: const TextStyle(
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.black,
// //                 ),
// //               ),

// //               // Right: Star + Cart icon
// //               Row(
// //                 children: [
// //                   const Icon(Icons.star, size: 14, color: Colors.amber),
// //                   const SizedBox(width: 2),
// //                   Text(
// //                     widget.rating.toString(),
// //                     style: const TextStyle(
// //                       fontSize: 12,
// //                       color: Colors.deepOrangeAccent,
// //                     ),
// //                   ),
// //                   const SizedBox(width: 6),
// //                   GestureDetector(
// //                     onTap: () {
// //                       // TODO: Add to cart logic here
// //                       ScaffoldMessenger.of(context).showSnackBar(
// //                         SnackBar(
// //                           content: Text('${widget.title} added to cart'),
// //                         ),
// //                       );
// //                     },
// //                     child: const Icon(
// //                       Icons.add_shopping_cart,
// //                       size: 18,
// //                       color: MyColors.primary,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // import 'package:bookify/utils/constants/colors.dart';
// // import 'package:flutter/material.dart';

// // class BookCard extends StatefulWidget {
// //   final String imagePath;
// //   final String title;
// //   final String category;
// //   final double price;
// //   final double rating;

// //   const BookCard({
// //     super.key,
// //     required this.imagePath,
// //     required this.title,
// //     required this.category,
// //     required this.price,
// //     required this.rating,
// //   });

// //   @override
// //   State<BookCard> createState() => _BookCardState();
// // }

// // class _BookCardState extends State<BookCard> {
// //   bool isFavorited = false;
// //   double userRating = 0;

// //   void _showRatingDialog() {
// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         double tempRating = userRating;
// //         return AlertDialog(
// //           title: const Text('Rate this book'),
// //           content: StatefulBuilder(
// //             builder: (context, setState) => Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: List.generate(5, (index) {
// //                 return RadioListTile<double>(
// //                   title: Text('${index + 1} Star${index > 0 ? 's' : ''}'),
// //                   value: (index + 1).toDouble(),
// //                   groupValue: tempRating,
// //                   onChanged: (value) {
// //                     setState(() {
// //                       tempRating = value!;
// //                     });
// //                   },
// //                 );
// //               }),
// //             ),
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () => Navigator.pop(context),
// //               child: const Text('Cancel'),
// //             ),
// //             ElevatedButton(
// //               onPressed: () {
// //                 setState(() => userRating = tempRating);
// //                 Navigator.pop(context);
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   SnackBar(
// //                     content: Text('You rated ${widget.title} $userRating ★'),
// //                   ),
// //                 );
// //               },
// //               child: const Text('Submit'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: 150,
// //       margin: const EdgeInsets.only(right: 12),
// //       padding: const EdgeInsets.all(8),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(12),
// //         boxShadow: const [
// //           BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // 📕 Book Image with Favorite icon
// //           Stack(
// //             children: [
// //               ClipRRect(
// //                 borderRadius: BorderRadius.circular(8),
// //                 child: Image.network(
// //                   widget.imagePath,
// //                   height: 160,
// //                   width: double.infinity,
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //               Positioned(
// //                 top: 6,
// //                 right: 6,
// //                 child: GestureDetector(
// //                   onTap: () {
// //                     setState(() => isFavorited = !isFavorited);
// //                     ScaffoldMessenger.of(context).showSnackBar(
// //                       SnackBar(
// //                         content: Text(
// //                           isFavorited
// //                               ? '${widget.title} added to wishlist'
// //                               : '${widget.title} removed from wishlist',
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                   child: Container(
// //                     padding: const EdgeInsets.all(4),
// //                     decoration: const BoxDecoration(
// //                       color: Colors.white,
// //                       shape: BoxShape.circle,
// //                     ),
// //                     child: Icon(
// //                       isFavorited ? Icons.favorite : Icons.favorite_border,
// //                       size: 18,
// //                       color: isFavorited ? Colors.red : Colors.grey,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),

// //           const SizedBox(height: 8),

// //           // 📘 Title
// //           Text(
// //             widget.title,
// //             maxLines: 1,
// //             overflow: TextOverflow.ellipsis,
// //             style: const TextStyle(
// //               fontWeight: FontWeight.w600,
// //               fontSize: 14,
// //               color: Colors.deepOrange,
// //             ),
// //           ),

// //           // 🏷️ Category
// //           Text(
// //             widget.category,
// //             style: const TextStyle(fontSize: 12, color: Colors.black),
// //           ),

// //           const SizedBox(height: 6),

// //           // 💵 Price | ⭐ Rating | 🛒 Cart
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               Text(
// //                 '\$${widget.price.toStringAsFixed(0)}',
// //                 style: const TextStyle(
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.black,
// //                 ),
// //               ),
// //               Row(
// //                 children: [
// //                   GestureDetector(
// //                     onTap: _showRatingDialog,
// //                     child: Row(
// //                       children: [
// //                         const Icon(Icons.star, size: 14, color: Colors.amber),
// //                         const SizedBox(width: 2),
// //                         Text(
// //                           userRating > 0
// //                               ? userRating.toString()
// //                               : widget.rating.toString(),
// //                           style: const TextStyle(
// //                             fontSize: 12,
// //                             color: Colors.deepOrangeAccent,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   const SizedBox(width: 6),
// //                   GestureDetector(
// //                     onTap: () {
// //                       // 🛒 Add to Cart
// //                       ScaffoldMessenger.of(context).showSnackBar(
// //                         SnackBar(
// //                           content: Text('${widget.title} added to cart'),
// //                         ),
// //                       );
// //                     },
// //                     child: const Icon(
// //                       Icons.add_shopping_cart,
// //                       size: 18,
// //                       color: MyColors.primary,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // import 'package:bookify/screens/cart.dart';
// // import 'package:bookify/utils/constants/colors.dart';
// // import 'package:flutter/material.dart';

// // class BookCard extends StatefulWidget {
// //   final String imagePath;
// //   final String title;
// //   final String category;
// //   final double price;
// //   final double rating;

// //   const BookCard({
// //     super.key,
// //     required this.imagePath,
// //     required this.title,
// //     required this.category,
// //     required this.price,
// //     required this.rating,
// //   });

// //   @override
// //   State<BookCard> createState() => _BookCardState();
// // }

// // class _BookCardState extends State<BookCard> {
// //   bool isFavorited = false;
// //   double userRating = 0;

// //   void _showRatingDialog() {
// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         double tempRating = userRating;
// //         return AlertDialog(
// //           title: const Text('Rate this book'),
// //           content: StatefulBuilder(
// //             builder: (context, setState) => Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: List.generate(5, (index) {
// //                 return RadioListTile<double>(
// //                   title: Text('${index + 1} Star${index > 0 ? 's' : ''}'),
// //                   value: (index + 1).toDouble(),
// //                   groupValue: tempRating,
// //                   onChanged: (value) {
// //                     setState(() {
// //                       tempRating = value!;
// //                     });
// //                   },
// //                 );
// //               }),
// //             ),
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () => Navigator.pop(context),
// //               child: const Text('Cancel'),
// //             ),
// //             ElevatedButton(
// //               onPressed: () {
// //                 setState(() => userRating = tempRating);
// //                 Navigator.pop(context);
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   SnackBar(
// //                     content: Text('You rated ${widget.title} $userRating ★'),
// //                   ),
// //                 );
// //               },
// //               child: const Text('Submit'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: 150,
// //       margin: const EdgeInsets.only(right: 12),
// //       padding: const EdgeInsets.all(8),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(12),
// //         boxShadow: const [
// //           BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Stack(
// //             children: [
// //               ClipRRect(
// //                 borderRadius: BorderRadius.circular(8),
// //                 child: Image.network(
// //                   widget.imagePath,
// //                   height: 160,
// //                   width: double.infinity,
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //               Positioned(
// //                 top: 6,
// //                 right: 6,
// //                 child: GestureDetector(
// //                   onTap: () {
// //                     setState(() => isFavorited = !isFavorited);
// //                     ScaffoldMessenger.of(context).showSnackBar(
// //                       SnackBar(
// //                         content: Text(
// //                           isFavorited
// //                               ? '${widget.title} added to wishlist'
// //                               : '${widget.title} removed from wishlist',
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                   child: Container(
// //                     padding: const EdgeInsets.all(4),
// //                     decoration: const BoxDecoration(
// //                       color: Colors.white,
// //                       shape: BoxShape.circle,
// //                     ),
// //                     child: Icon(
// //                       isFavorited ? Icons.favorite : Icons.favorite_border,
// //                       size: 18,
// //                       color: isFavorited ? Colors.red : Colors.grey,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //           const SizedBox(height: 8),
// //           Text(
// //             widget.title,
// //             maxLines: 1,
// //             overflow: TextOverflow.ellipsis,
// //             style: const TextStyle(
// //               fontWeight: FontWeight.w600,
// //               fontSize: 14,
// //               color: Colors.deepOrange,
// //             ),
// //           ),
// //           Text(
// //             widget.category,
// //             style: const TextStyle(fontSize: 12, color: Colors.black),
// //           ),
// //           const SizedBox(height: 6),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               Text(
// //                 '\$${widget.price.toStringAsFixed(0)}',
// //                 style: const TextStyle(
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.black,
// //                 ),
// //               ),
// //               Row(
// //                 children: [
// //                   GestureDetector(
// //                     onTap: _showRatingDialog,
// //                     child: Row(
// //                       children: [
// //                         const Icon(Icons.star, size: 14, color: Colors.amber),
// //                         const SizedBox(width: 2),
// //                         Text(
// //                           userRating > 0
// //                               ? userRating.toString()
// //                               : widget.rating.toString(),
// //                           style: const TextStyle(
// //                             fontSize: 12,
// //                             color: Colors.deepOrangeAccent,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   const SizedBox(width: 6),
// //                   GestureDetector(
// //                     onTap: () {
// //                       CartManager.addToCart(
// //                         CartItem(
// //                           title: widget.title,
// //                           author: 'Author Unknown',
// //                           imageUrl: widget.imagePath,
// //                           price: widget.price,
// //                         ),
// //                       );

// //                       ScaffoldMessenger.of(context).showSnackBar(
// //                         SnackBar(
// //                           content: Text('${widget.title} added to cart'),
// //                         ),
// //                       );
// //                     },
// //                     child: const Icon(
// //                       Icons.add_shopping_cart,
// //                       size: 18,
// //                       color: MyColors.primary,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // import 'package:bookify/managers/wishlist_manager.dart';
// // import 'package:bookify/managers/cart_manager.dart';
// // import 'package:bookify/models/cart_item.dart';
// // import 'package:bookify/utils/constants/colors.dart';
// // import 'package:flutter/material.dart';

// // class BookCard extends StatefulWidget {
// //   final String imagePath;
// //   final String title;
// //   final String category;
// //   final double price;
// //   final double rating;

// //   const BookCard({
// //     super.key,
// //     required this.imagePath,
// //     required this.title,
// //     required this.category,
// //     required this.price,
// //     required this.rating,
// //   });

// //   @override
// //   State<BookCard> createState() => _BookCardState();
// // }

// // class _BookCardState extends State<BookCard> {
// //   bool isFavorited = false;
// //   double userRating = 0;

// //   @override
// //   void initState() {
// //     super.initState();
// //     isFavorited = WishlistManager.isInWishlist(widget.title);
// //   }

// //   void _showRatingDialog() {
// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         double tempRating = userRating;
// //         return AlertDialog(
// //           title: const Text('Rate this book'),
// //           content: StatefulBuilder(
// //             builder: (context, setState) => Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: List.generate(5, (index) {
// //                 return RadioListTile<double>(
// //                   title: Text('${index + 1} Star${index > 0 ? 's' : ''}'),
// //                   value: (index + 1).toDouble(),
// //                   groupValue: tempRating,
// //                   onChanged: (value) {
// //                     setState(() {
// //                       tempRating = value!;
// //                     });
// //                   },
// //                 );
// //               }),
// //             ),
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () => Navigator.pop(context),
// //               child: const Text('Cancel'),
// //             ),
// //             ElevatedButton(
// //               onPressed: () {
// //                 setState(() => userRating = tempRating);
// //                 Navigator.pop(context);
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   SnackBar(
// //                     content: Text('You rated ${widget.title} $userRating ★'),
// //                   ),
// //                 );
// //               },
// //               child: const Text('Submit'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: 150,
// //       margin: const EdgeInsets.only(right: 12),
// //       padding: const EdgeInsets.all(8),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(12),
// //         boxShadow: const [
// //           BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // 📕 Image + Heart
// //           Stack(
// //             children: [
// //               ClipRRect(
// //                 borderRadius: BorderRadius.circular(8),
// //                 child: Image.network(
// //                   widget.imagePath,
// //                   height: 160,
// //                   width: double.infinity,
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //               Positioned(
// //                 top: 6,
// //                 right: 6,
// //                 child: GestureDetector(
// //                   onTap: () {
// //                     setState(() => isFavorited = !isFavorited);

// //                     final item = CartItem(
// //                       title: widget.title,
// //                       author: 'Author Unknown',
// //                       imageUrl: widget.imagePath,
// //                       price: widget.price,
// //                     );

// //                     if (isFavorited) {
// //                       WishlistManager.addToWishlist(item);
// //                     } else {
// //                       WishlistManager.removeFromWishlist(item);
// //                     }

// //                     ScaffoldMessenger.of(context).showSnackBar(
// //                       SnackBar(
// //                         content: Text(
// //                           isFavorited
// //                               ? '${widget.title} added to wishlist'
// //                               : '${widget.title} removed from wishlist',
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                   child: Container(
// //                     padding: const EdgeInsets.all(4),
// //                     decoration: const BoxDecoration(
// //                       color: Colors.white,
// //                       shape: BoxShape.circle,
// //                     ),
// //                     child: Icon(
// //                       isFavorited ? Icons.favorite : Icons.favorite_border,
// //                       size: 18,
// //                       color: isFavorited ? Colors.red : Colors.grey,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),

// //           const SizedBox(height: 8),

// //           // 📘 Title
// //           Text(
// //             widget.title,
// //             maxLines: 1,
// //             overflow: TextOverflow.ellipsis,
// //             style: const TextStyle(
// //               fontWeight: FontWeight.w600,
// //               fontSize: 14,
// //               color: Colors.deepOrange,
// //             ),
// //           ),

// //           // 🏷️ Category
// //           Text(
// //             widget.category,
// //             style: const TextStyle(fontSize: 12, color: Colors.black),
// //           ),

// //           const SizedBox(height: 6),

// //           // 💰 Price + ⭐ Rating + 🛒 Cart
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               Text(
// //                 '\$${widget.price.toStringAsFixed(0)}',
// //                 style: const TextStyle(
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.black,
// //                 ),
// //               ),
// //               Row(
// //                 children: [
// //                   GestureDetector(
// //                     onTap: _showRatingDialog,
// //                     child: Row(
// //                       children: [
// //                         const Icon(Icons.star, size: 14, color: Colors.amber),
// //                         const SizedBox(width: 2),
// //                         Text(
// //                           userRating > 0
// //                               ? userRating.toString()
// //                               : widget.rating.toString(),
// //                           style: const TextStyle(
// //                             fontSize: 12,
// //                             color: Colors.deepOrangeAccent,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   const SizedBox(width: 6),
// //                   GestureDetector(
// //                     onTap: () {
// //                       CartManager.addToCart(
// //                         CartItem(
// //                           title: widget.title,
// //                           author: 'Author Unknown',
// //                           imageUrl: widget.imagePath,
// //                           price: widget.price,
// //                         ),
// //                       );
// //                       ScaffoldMessenger.of(context).showSnackBar(
// //                         SnackBar(
// //                           content: Text('${widget.title} added to cart'),
// //                         ),
// //                       );
// //                     },
// //                     child: const Icon(
// //                       Icons.add_shopping_cart,
// //                       size: 18,
// //                       color: MyColors.primary,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // import 'package:bookify/managers/wishlist_manager.dart';
// // import 'package:bookify/managers/cart_manager.dart';
// // import 'package:bookify/models/cart_item.dart';
// // import 'package:bookify/utils/constants/colors.dart';
// // import 'package:flutter/material.dart';

// // class BookCard extends StatefulWidget {
// //   final String bookId; // ✅ New: bookId required
// //   final String imagePath;
// //   final String title;
// //   final String category;
// //   final double price;
// //   final double rating;

// //   const BookCard({
// //     super.key,
// //     required this.bookId, // ✅ required in constructor
// //     required this.imagePath,
// //     required this.title,
// //     required this.category,
// //     required this.price,
// //     required this.rating,
// //   });

// //   @override
// //   State<BookCard> createState() => _BookCardState();
// // }

// // class _BookCardState extends State<BookCard> {
// //   bool isFavorited = false;
// //   double userRating = 0;

// //   @override
// //   void initState() {
// //     super.initState();
// //     isFavorited = WishlistManager.isInWishlist(widget.title);
// //   }

// //   void _showRatingDialog() {
// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         double tempRating = userRating;
// //         return AlertDialog(
// //           title: const Text('Rate this book'),
// //           content: StatefulBuilder(
// //             builder: (context, setState) => Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: List.generate(5, (index) {
// //                 return RadioListTile<double>(
// //                   title: Text('${index + 1} Star${index > 0 ? 's' : ''}'),
// //                   value: (index + 1).toDouble(),
// //                   groupValue: tempRating,
// //                   onChanged: (value) {
// //                     setState(() {
// //                       tempRating = value!;
// //                     });
// //                   },
// //                 );
// //               }),
// //             ),
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () => Navigator.pop(context),
// //               child: const Text('Cancel'),
// //             ),
// //             ElevatedButton(
// //               onPressed: () {
// //                 setState(() => userRating = tempRating);
// //                 Navigator.pop(context);
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   SnackBar(
// //                     content: Text('You rated ${widget.title} $userRating ★'),
// //                   ),
// //                 );
// //               },
// //               child: const Text('Submit'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: 150,
// //       margin: const EdgeInsets.only(right: 12),
// //       padding: const EdgeInsets.all(8),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(12),
// //         boxShadow: const [
// //           BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // 📕 Image + Heart
// //           Stack(
// //             children: [
// //               ClipRRect(
// //                 borderRadius: BorderRadius.circular(8),
// //                 child: Image.network(
// //                   widget.imagePath,
// //                   height: 160,
// //                   width: double.infinity,
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //               Positioned(
// //                 top: 6,
// //                 right: 6,
// //                 child: GestureDetector(
// //                   onTap: () {
// //                     setState(() => isFavorited = !isFavorited);

// //                     final item = CartItem(
// //                       bookId: widget.bookId, // ✅ Pass bookId here
// //                       title: widget.title,
// //                       author: 'Author Unknown',
// //                       imageUrl: widget.imagePath,
// //                       price: widget.price,
// //                     );

// //                     if (isFavorited) {
// //                       WishlistManager.addToWishlist(item);
// //                     } else {
// //                       WishlistManager.removeFromWishlist(item);
// //                     }

// //                     ScaffoldMessenger.of(context).showSnackBar(
// //                       SnackBar(
// //                         content: Text(
// //                           isFavorited
// //                               ? '${widget.title} added to wishlist'
// //                               : '${widget.title} removed from wishlist',
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                   child: Container(
// //                     padding: const EdgeInsets.all(4),
// //                     decoration: const BoxDecoration(
// //                       color: Colors.white,
// //                       shape: BoxShape.circle,
// //                     ),
// //                     child: Icon(
// //                       isFavorited ? Icons.favorite : Icons.favorite_border,
// //                       size: 18,
// //                       color: isFavorited ? Colors.red : Colors.grey,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),

// //           const SizedBox(height: 8),

// //           // 📘 Title
// //           Text(
// //             widget.title,
// //             maxLines: 1,
// //             overflow: TextOverflow.ellipsis,
// //             style: const TextStyle(
// //               fontWeight: FontWeight.w600,
// //               fontSize: 14,
// //               color: Colors.deepOrange,
// //             ),
// //           ),

// //           // 🏷️ Category
// //           Text(
// //             widget.category,
// //             style: const TextStyle(fontSize: 12, color: Colors.black),
// //           ),

// //           const SizedBox(height: 6),

// //           // 💰 Price + ⭐ Rating + 🛒 Cart
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               Text(
// //                 '\$${widget.price.toStringAsFixed(0)}',
// //                 style: const TextStyle(
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.black,
// //                 ),
// //               ),
// //               Row(
// //                 children: [
// //                   GestureDetector(
// //                     onTap: _showRatingDialog,
// //                     child: Row(
// //                       children: [
// //                         const Icon(Icons.star, size: 14, color: Colors.amber),
// //                         const SizedBox(width: 2),
// //                         Text(
// //                           userRating > 0
// //                               ? userRating.toString()
// //                               : widget.rating.toString(),
// //                           style: const TextStyle(
// //                             fontSize: 12,
// //                             color: Colors.deepOrangeAccent,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   const SizedBox(width: 6),
// //                   GestureDetector(
// //                     onTap: () {
// //                       CartManager.addToCart(
// //                         CartItem(
// //                           bookId: widget.bookId, // ✅ Required field
// //                           title: widget.title,
// //                           author: 'Author Unknown',
// //                           imageUrl: widget.imagePath,
// //                           price: widget.price,
// //                         ),
// //                       );
// //                       ScaffoldMessenger.of(context).showSnackBar(
// //                         SnackBar(
// //                           content: Text('${widget.title} added to cart'),
// //                         ),
// //                       );
// //                     },
// //                     child: const Icon(
// //                       Icons.add_shopping_cart,
// //                       size: 18,
// //                       color: MyColors.primary,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:bookify/managers/wishlist_manager.dart';
// import 'package:bookify/managers/cart_manager.dart';
// import 'package:bookify/models/cart_item.dart';
// import 'package:bookify/utils/constants/colors.dart';
// import 'package:flutter/material.dart';

// class BookCard extends StatefulWidget {
//   final String bookId;
//   final String imagePath;
//   final String title;
//   final String category;
//   final double price;
//   final double rating;

//   const BookCard({
//     super.key,
//     required this.bookId,
//     required this.imagePath,
//     required this.title,
//     required this.category,
//     required this.price,
//     required this.rating,
//   });

//   @override
//   State<BookCard> createState() => _BookCardState();
// }

// class _BookCardState extends State<BookCard> {
//   bool isFavorited = false;
//   double userRating = 0;

//   @override
//   void initState() {
//     super.initState();
//     _checkWishlistStatus(); // ✅ Check from Firestore
//   }

//   void _checkWishlistStatus() async {
//     final exists = await WishlistManager.isInWishlist(widget.bookId);
//     setState(() => isFavorited = exists);
//   }

//   void _showRatingDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         double tempRating = userRating;
//         return AlertDialog(
//           title: const Text('Rate this book'),
//           content: StatefulBuilder(
//             builder: (context, setState) => Column(
//               mainAxisSize: MainAxisSize.min,
//               children: List.generate(5, (index) {
//                 return RadioListTile<double>(
//                   title: Text('${index + 1} Star${index > 0 ? 's' : ''}'),
//                   value: (index + 1).toDouble(),
//                   groupValue: tempRating,
//                   onChanged: (value) {
//                     setState(() {
//                       tempRating = value!;
//                     });
//                   },
//                 );
//               }),
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() => userRating = tempRating);
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('You rated ${widget.title} $userRating ★'),
//                   ),
//                 );
//               },
//               child: const Text('Submit'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 150,
//       margin: const EdgeInsets.only(right: 12),
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: const [
//           BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // 📕 Image + Heart
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.network(
//                   widget.imagePath,
//                   height: 160,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Positioned(
//                 top: 6,
//                 right: 6,
//                 child: GestureDetector(
//                   onTap: () async {
//                     final item = CartItem(
//                       bookId: widget.bookId,
//                       title: widget.title,
//                       author: 'Author Unknown',
//                       imageUrl: widget.imagePath,
//                       price: widget.price,
//                     );

//                     setState(() => isFavorited = !isFavorited);

//                     if (isFavorited) {
//                       await WishlistManager.addToWishlist(item);
//                     } else {
//                       await WishlistManager.removeFromWishlist(item);
//                     }

//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(
//                           isFavorited
//                               ? '${widget.title} added to wishlist'
//                               : '${widget.title} removed from wishlist',
//                         ),
//                       ),
//                     );
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(4),
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(
//                       isFavorited ? Icons.favorite : Icons.favorite_border,
//                       size: 18,
//                       color: isFavorited ? Colors.red : Colors.grey,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 8),

//           // 📘 Title
//           Text(
//             widget.title,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             style: const TextStyle(
//               fontWeight: FontWeight.w600,
//               fontSize: 14,
//               color: Colors.deepOrange,
//             ),
//           ),

//           // 🏷️ Category
//           Text(
//             widget.category,
//             style: const TextStyle(fontSize: 12, color: Colors.black),
//           ),

//           const SizedBox(height: 6),

//           // 💰 Price + ⭐ Rating + 🛒 Cart
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 '\$${widget.price.toStringAsFixed(0)}',
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               Row(
//                 children: [
//                   GestureDetector(
//                     onTap: _showRatingDialog,
//                     child: Row(
//                       children: [
//                         const Icon(Icons.star, size: 14, color: Colors.amber),
//                         const SizedBox(width: 2),
//                         Text(
//                           userRating > 0
//                               ? userRating.toString()
//                               : widget.rating.toString(),
//                           style: const TextStyle(
//                             fontSize: 12,
//                             color: Colors.deepOrangeAccent,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 6),
//                   GestureDetector(
//                     onTap: () {
//                       CartManager.addToCart(
//                         CartItem(
//                           bookId: widget.bookId,
//                           title: widget.title,
//                           author: 'Author Unknown',
//                           imageUrl: widget.imagePath,
//                           price: widget.price,
//                         ),
//                       );
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text('${widget.title} added to cart'),
//                         ),
//                       );
//                     },
//                     child: const Icon(
//                       Icons.add_shopping_cart,
//                       size: 18,
//                       color: MyColors.primary,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:bookify/managers/wishlist_manager.dart';
// import 'package:bookify/managers/cart_manager.dart';
// import 'package:bookify/models/cart_item.dart';
// import 'package:bookify/utils/constants/colors.dart';
// import 'package:flutter/material.dart';

// class BookCard extends StatefulWidget {
//   final String bookId;
//   final String title;
//   final String author; // ✅ Used internally only
//   final String imagePath;
//   final String category;
//   final double price;
//   final double rating;

//   const BookCard({
//     super.key,
//     required this.bookId,
//     required this.title,
//     required this.author,
//     required this.imagePath,
//     required this.category,
//     required this.price,
//     required this.rating,
//   });

//   @override
//   State<BookCard> createState() => _BookCardState();
// }

// class _BookCardState extends State<BookCard> {
//   bool isFavorited = false;
//   double userRating = 0;

//   @override
//   void initState() {
//     super.initState();
//     _loadWishlistStatus();
//   }

//   Future<void> _loadWishlistStatus() async {
//     final exists = await WishlistManager.isInWishlist(widget.bookId);
//     setState(() => isFavorited = exists);
//   }

//   void _showRatingDialog() {
//     double tempRating = userRating;
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Rate this book'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: List.generate(5, (index) {
//             return RadioListTile<double>(
//               title: Text('${index + 1} Star${index > 0 ? 's' : ''}'),
//               value: (index + 1).toDouble(),
//               groupValue: tempRating,
//               onChanged: (value) {
//                 setState(() => tempRating = value ?? 0);
//               },
//             );
//           }),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               setState(() => userRating = tempRating);
//               Navigator.pop(context);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text('You rated ${widget.title} $userRating ★'),
//                 ),
//               );
//             },
//             child: const Text('Submit'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 150,
//       margin: const EdgeInsets.only(right: 12),
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: const [
//           BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// 📕 Image + Favorite
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.network(
//                   widget.imagePath,
//                   height: 160,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, _, __) =>
//                       const Icon(Icons.broken_image),
//                 ),
//               ),
//               Positioned(
//                 top: 6,
//                 right: 6,
//                 child: GestureDetector(
//                   onTap: () async {
//                     final item = CartItem(
//                       bookId: widget.bookId,
//                       title: widget.title,
//                       author: widget.author, // used internally
//                       imageUrl: widget.imagePath,
//                       price: widget.price,
//                     );

//                     setState(() => isFavorited = !isFavorited);

//                     if (isFavorited) {
//                       await WishlistManager.addToWishlist(item);
//                     } else {
//                       await WishlistManager.removeFromWishlist(item);
//                     }

//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(
//                           isFavorited
//                               ? '${widget.title} added to wishlist'
//                               : '${widget.title} removed from wishlist',
//                         ),
//                       ),
//                     );
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(4),
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(
//                       isFavorited ? Icons.favorite : Icons.favorite_border,
//                       size: 18,
//                       color: isFavorited ? Colors.red : Colors.grey,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 8),

//           /// 📝 Title
//           Text(
//             widget.title,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             style: const TextStyle(
//               fontWeight: FontWeight.w600,
//               fontSize: 14,
//               color: Colors.deepOrange,
//             ),
//           ),

//           /// 🏷️ Category
//           Text(
//             widget.category,
//             style: const TextStyle(fontSize: 12, color: Colors.black),
//           ),

//           const SizedBox(height: 6),

//           /// 💵 Price | ⭐ Rating | 🛒 Cart
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 '\$${widget.price.toStringAsFixed(0)}',
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               Row(
//                 children: [
//                   GestureDetector(
//                     onTap: _showRatingDialog,
//                     child: Row(
//                       children: [
//                         const Icon(Icons.star, size: 14, color: Colors.amber),
//                         const SizedBox(width: 2),
//                         Text(
//                           userRating > 0
//                               ? userRating.toString()
//                               : widget.rating.toString(),
//                           style: const TextStyle(
//                             fontSize: 12,
//                             color: Colors.deepOrangeAccent,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 6),
//                   GestureDetector(
//                     onTap: () {
//                       CartManager.addToCart(
//                         CartItem(
//                           bookId: widget.bookId,
//                           title: widget.title,
//                           author: widget.author,
//                           imageUrl: widget.imagePath,
//                           price: widget.price,
//                         ),
//                       );
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text('${widget.title} added to cart'),
//                         ),
//                       );
//                     },
//                     child: const Icon(
//                       Icons.add_shopping_cart,
//                       size: 18,
//                       color: MyColors.primary,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:bookify/managers/wishlist_manager.dart';
// import 'package:bookify/managers/cart_manager.dart';
// import 'package:bookify/models/cart_item.dart';
// import 'package:bookify/utils/constants/colors.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class BookCard extends StatefulWidget {
//   final String bookId;
//   final String title;
//   final String author;
//   final String imagePath;
//   final String category;
//   final double price;

//   const BookCard({
//     super.key,
//     required this.bookId,
//     required this.title,
//     required this.author,
//     required this.imagePath,
//     required this.category,
//     required this.price,
//   });

//   @override
//   State<BookCard> createState() => _BookCardState();
// }

// class _BookCardState extends State<BookCard> {
//   bool isFavorited = false;
//   double averageRating = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     _loadWishlistStatus();
//     _fetchAverageRating();
//   }

//   Future<void> _loadWishlistStatus() async {
//     final exists = await WishlistManager.isInWishlist(widget.bookId);
//     setState(() => isFavorited = exists);
//   }

//   Future<void> _fetchAverageRating() async {
//     final snapshot = await FirebaseFirestore.instance
//         .collection('book_reviews')
//         .where('bookId', isEqualTo: widget.bookId)
//         .get();

//     if (snapshot.docs.isNotEmpty) {
//       final total = snapshot.docs.fold<double>(
//         0.0,
//         (sum, doc) => sum + (doc['rating'] as num).toDouble(),
//       );
//       setState(() {
//         averageRating = total / snapshot.docs.length;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 150,
//       margin: const EdgeInsets.only(right: 12),
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: const [
//           BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// 📕 Image + Favorite
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.network(
//                   widget.imagePath,
//                   height: 160,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, _, __) =>
//                       const Icon(Icons.broken_image),
//                 ),
//               ),
//               Positioned(
//                 top: 6,
//                 right: 6,
//                 child: GestureDetector(
//                   onTap: () async {
//                     final item = CartItem(
//                       bookId: widget.bookId,
//                       title: widget.title,
//                       author: widget.author,
//                       imageUrl: widget.imagePath,
//                       price: widget.price,
//                     );

//                     setState(() => isFavorited = !isFavorited);

//                     if (isFavorited) {
//                       await WishlistManager.addToWishlist(item);
//                     } else {
//                       await WishlistManager.removeFromWishlist(item);
//                     }

//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(
//                           isFavorited
//                               ? '${widget.title} added to wishlist'
//                               : '${widget.title} removed from wishlist',
//                         ),
//                       ),
//                     );
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(4),
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(
//                       isFavorited ? Icons.favorite : Icons.favorite_border,
//                       size: 18,
//                       color: isFavorited ? Colors.red : Colors.grey,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 8),

//           /// 📝 Title
//           Text(
//             widget.title,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             style: const TextStyle(
//               fontWeight: FontWeight.w600,
//               fontSize: 14,
//               color: Colors.deepOrange,
//             ),
//           ),

//           /// 🏷️ Category
//           Text(
//             widget.category,
//             style: const TextStyle(fontSize: 12, color: Colors.black),
//           ),

//           const SizedBox(height: 6),

//           /// 💵 Price | ⭐ Rating | 🛒 Cart
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 '\$${widget.price.toStringAsFixed(0)}',
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               Row(
//                 children: [
//                   Row(
//                     children: [
//                       const Icon(Icons.star, size: 14, color: Colors.amber),
//                       const SizedBox(width: 2),
//                       Text(
//                         averageRating.toStringAsFixed(1),
//                         style: const TextStyle(
//                           fontSize: 12,
//                           color: Colors.deepOrangeAccent,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(width: 6),
//                   GestureDetector(
//                     onTap: () {
//                       CartManager.addToCart(
//                         CartItem(
//                           bookId: widget.bookId,
//                           title: widget.title,
//                           author: widget.author,
//                           imageUrl: widget.imagePath,
//                           price: widget.price,
//                         ),
//                       );
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text('${widget.title} added to cart'),
//                         ),
//                       );
//                     },
//                     child: const Icon(
//                       Icons.add_shopping_cart,
//                       size: 18,
//                       color: MyColors.primary,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:bookify/managers/wishlist_manager.dart';
import 'package:bookify/managers/cart_manager.dart';
import 'package:bookify/models/cart_item.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookCard extends StatefulWidget {
  final String bookId;
  final String title;
  final String author;
  final String imagePath;
  final String category;
  final double price;
  final double? rating; // ✅ Now optional

  const BookCard({
    super.key,
    required this.bookId,
    required this.title,
    required this.author,
    required this.imagePath,
    required this.category,
    required this.price,
    this.rating, // ✅ Optional
  });

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  bool isFavorited = false;
  double averageRating = 0.0;

  @override
  void initState() {
    super.initState();
    averageRating = widget.rating ?? 0.0; // ✅ Fallback to 0.0 if null
    _loadWishlistStatus();
    _fetchAverageRating(); // ✅ Override from Firestore if available
  }

  Future<void> _loadWishlistStatus() async {
    final exists = await WishlistManager.isInWishlist(widget.bookId);
    setState(() => isFavorited = exists);
  }

  Future<void> _fetchAverageRating() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('book_reviews')
        .where('bookId', isEqualTo: widget.bookId)
        .get();

    if (snapshot.docs.isNotEmpty) {
      final total = snapshot.docs.fold<double>(
        0.0,
        (sum, doc) => sum + (doc['rating'] as num).toDouble(),
      );
      setState(() {
        averageRating = total / snapshot.docs.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 📕 Image + Favorite Button
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.imagePath,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, _, __) =>
                      const Icon(Icons.broken_image),
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: GestureDetector(
                  onTap: () async {
                    final item = CartItem(
                      bookId: widget.bookId,
                      title: widget.title,
                      author: widget.author,
                      imageUrl: widget.imagePath,
                      price: widget.price,
                    );

                    setState(() => isFavorited = !isFavorited);

                    if (isFavorited) {
                      await WishlistManager.addToWishlist(item);
                    } else {
                      await WishlistManager.removeFromWishlist(item);
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          isFavorited
                              ? '${widget.title} added to wishlist'
                              : '${widget.title} removed from wishlist',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isFavorited ? Icons.favorite : Icons.favorite_border,
                      size: 18,
                      color: isFavorited ? Colors.red : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // 📝 Title
          Text(
            widget.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.deepOrange,
            ),
          ),

          // 🏷️ Category
          Text(
            widget.category,
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),

          const SizedBox(height: 6),

          // 💵 Price | ⭐ Rating | 🛒 Cart
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${widget.price.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star, size: 14, color: Colors.amber),
                  const SizedBox(width: 2),
                  Text(
                    averageRating.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: () {
                      CartManager.addToCart(
                        CartItem(
                          bookId: widget.bookId,
                          title: widget.title,
                          author: widget.author,
                          imageUrl: widget.imagePath,
                          price: widget.price,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${widget.title} added to cart'),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.add_shopping_cart,
                      size: 18,
                      color: MyColors.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
