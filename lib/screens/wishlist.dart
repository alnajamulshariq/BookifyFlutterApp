// import 'package:bookify/screens/auth/users/sign_in.dart';
// import 'package:bookify/utils/constants/colors.dart';
// import 'package:bookify/utils/themes/custom_themes/app_navbar.dart';
// import 'package:bookify/utils/themes/custom_themes/bottomnavbar.dart';
// import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class WishListScreen extends StatefulWidget {
//   const WishListScreen({super.key});

//   @override
//   State<WishListScreen> createState() => _WishListScreenState();
// }

// class _WishListScreenState extends State<WishListScreen> {
//   final auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFeeeeee),
//       bottomNavigationBar: buildCurvedNavBar(context, 3),
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(height: 30),
//             const CustomNavBar(),
//             const SizedBox(height: 10),

//             Expanded(
//               child: ListView.builder(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 24,
//                   vertical: 16,
//                 ),
//                 itemCount: 5,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     margin: const EdgeInsets.only(bottom: 16),
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16),
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Colors.teal,
//                           blurRadius: 6,
//                           offset: Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 80,
//                           height: 100,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8),
//                             image: const DecorationImage(
//                               image: AssetImage("assets/images/thespidy.jpg"),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: const [
//                               Text(
//                                 "Book Title",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 16,
//                                   color: MyColors.primary,
//                                 ),
//                               ),
//                               SizedBox(height: 4),
//                               Text(
//                                 "Author Name",
//                                 style: TextStyle(color: Colors.deepOrange),
//                               ),
//                               SizedBox(height: 8),
//                               Text(
//                                 "\$9.99",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.teal,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Column(
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     content: Text("Added to cart"),
//                                   ),
//                                 );
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.all(6),
//                                 decoration: BoxDecoration(
//                                   color: Colors.teal.shade100,
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: const Icon(Icons.shopping_cart_outlined),
//                               ),
//                             ),
//                             const SizedBox(height: 12),
//                             InkWell(
//                               onTap: () {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     content: Text("Removed from wishlist"),
//                                   ),
//                                 );
//                               },
//                               child: const Icon(
//                                 Icons.delete_outline,
//                                 color: Colors.red,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





// import 'package:bookify/models/cart_item.dart';
// import 'package:bookify/managers/cart_manager.dart';
// import 'package:bookify/managers/wishlist_manager.dart';
// import 'package:bookify/utils/constants/colors.dart';
// import 'package:bookify/utils/themes/custom_themes/app_navbar.dart';
// import 'package:bookify/utils/themes/custom_themes/bottomnavbar.dart';
// import 'package:flutter/material.dart';

// class WishListScreen extends StatefulWidget {
//   const WishListScreen({super.key});

//   @override
//   State<WishListScreen> createState() => _WishListScreenState();
// }

// class _WishListScreenState extends State<WishListScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final wishlistItems = WishlistManager.wishlistItems;

//     return Scaffold(
//       backgroundColor: const Color(0xFFeeeeee),
//       bottomNavigationBar: buildCurvedNavBar(context, 3),
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(height: 30),
//             const CustomNavBar(),
//             const SizedBox(height: 10),
//             Expanded(
//               child: wishlistItems.isEmpty
//                   ? const Center(
//                       child: Text(
//                         'No item in wishlist',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.grey,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     )
//                   : ListView.builder(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 24,
//                         vertical: 16,
//                       ),
//                       itemCount: wishlistItems.length,
//                       itemBuilder: (context, index) {
//                         final item = wishlistItems[index];
//                         final isFavorited = WishlistManager.isInWishlist(item.title);

//                         return Container(
//                           margin: const EdgeInsets.only(bottom: 16),
//                           padding: const EdgeInsets.all(16),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(16),
//                             boxShadow: const [
//                               BoxShadow(
//                                 color: Colors.teal,
//                                 blurRadius: 6,
//                                 offset: Offset(0, 2),
//                               ),
//                             ],
//                           ),
//                           child: Row(
//                             children: [
//                               // Book Image + Heart
//                               Stack(
//                                 children: [
//                                   Container(
//                                     width: 80,
//                                     height: 100,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(8),
//                                       image: DecorationImage(
//                                         image: NetworkImage(item.imageUrl),
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     top: 4,
//                                     right: 4,
//                                     child: GestureDetector(
//                                       onTap: () {
//                                         setState(() {
//                                           if (isFavorited) {
//                                             WishlistManager.removeFromWishlist(item);
//                                           } else {
//                                             WishlistManager.addToWishlist(item);
//                                           }
//                                         });
//                                         ScaffoldMessenger.of(context).showSnackBar(
//                                           SnackBar(
//                                             content: Text(
//                                               isFavorited
//                                                   ? '${item.title} removed from wishlist'
//                                                   : '${item.title} added to wishlist',
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                       child: Container(
//                                         padding: const EdgeInsets.all(4),
//                                         decoration: const BoxDecoration(
//                                           color: Colors.white,
//                                           shape: BoxShape.circle,
//                                         ),
//                                         child: Icon(
//                                           isFavorited ? Icons.favorite : Icons.favorite_border,
//                                           size: 18,
//                                           color: isFavorited ? Colors.red : Colors.grey,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(width: 16),

//                               // Book Info
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       item.title,
//                                       style: const TextStyle(
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 16,
//                                         color: MyColors.primary,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 4),
//                                     Text(
//                                       item.author,
//                                       style: const TextStyle(
//                                         color: Colors.deepOrange,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 8),
//                                     Text(
//                                       '\$${item.price.toStringAsFixed(2)}',
//                                       style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.teal,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),

//                               // Actions: Add to Cart + Delete
//                               Column(
//                                 children: [
//                                   InkWell(
//                                     onTap: () {
//                                       CartManager.addToCart(item);
//                                       WishlistManager.removeFromWishlist(item);
//                                       setState(() {});
//                                       ScaffoldMessenger.of(context).showSnackBar(
//                                         SnackBar(
//                                           content: Text('${item.title} added to cart'),
//                                         ),
//                                       );
//                                     },
//                                     child: Container(
//                                       padding: const EdgeInsets.all(6),
//                                       decoration: BoxDecoration(
//                                         color: Colors.teal.shade100,
//                                         shape: BoxShape.circle,
//                                       ),
//                                       child: const Icon(Icons.shopping_cart_outlined),
//                                     ),
//                                   ),
//                                   const SizedBox(height: 12),
//                                   InkWell(
//                                     onTap: () {
//                                       WishlistManager.removeFromWishlist(item);
//                                       setState(() {});
//                                       ScaffoldMessenger.of(context).showSnackBar(
//                                         SnackBar(
//                                           content: Text('${item.title} removed from wishlist'),
//                                         ),
//                                       );
//                                     },
//                                     child: const Icon(
//                                       Icons.delete_outline,
//                                       color: Colors.red,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:bookify/models/cart_item.dart';
import 'package:bookify/managers/cart_manager.dart';
import 'package:bookify/managers/wishlist_manager.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/app_navbar.dart';
import 'package:bookify/utils/themes/custom_themes/bottomnavbar.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeeeeee),
      bottomNavigationBar: buildCurvedNavBar(context, 3),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const CustomNavBar(),
            const SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<List<CartItem>>(
                stream: WishlistManager.getWishlistStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final wishlistItems = snapshot.data ?? [];

                  if (wishlistItems.isEmpty) {
                    return const Center(
                      child: Text(
                        'No item in wishlist',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    itemCount: wishlistItems.length,
                    itemBuilder: (context, index) {
                      final item = wishlistItems[index];

                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.teal,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // Book Image + Heart
                            Stack(
                              children: [
                                Container(
                                  width: 80,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: NetworkImage(item.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 4,
                                  right: 4,
                                  child: GestureDetector(
                                    onTap: () {
                                      WishlistManager.removeFromWishlist(item);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('${item.title} removed from wishlist'),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.favorite, size: 18, color: Colors.red),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 16),

                            // Book Info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: MyColors.primary,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item.author,
                                    style: const TextStyle(color: Colors.deepOrange),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '\$${item.price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Actions
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    CartManager.addToCart(item);
                                    WishlistManager.removeFromWishlist(item);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('${item.title} added to cart')),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Colors.teal.shade100,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.shopping_cart_outlined),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                InkWell(
                                  onTap: () {
                                    WishlistManager.removeFromWishlist(item);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('${item.title} removed from wishlist')),
                                    );
                                  },
                                  child: const Icon(Icons.delete_outline, color: Colors.red),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
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
