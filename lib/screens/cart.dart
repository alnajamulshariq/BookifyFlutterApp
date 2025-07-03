// import 'package:bookify/screens/auth/users/sign_in.dart';
// import 'package:bookify/screens/checkout.dart';
// import 'package:bookify/utils/constants/colors.dart';
// import 'package:bookify/utils/themes/custom_themes/app_navbar.dart';
// import 'package:bookify/utils/themes/custom_themes/bottomnavbar.dart';
// import 'package:bookify/utils/themes/custom_themes/elevated_button_theme.dart';
// import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   final auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFeeeeee),
//       bottomNavigationBar: buildCurvedNavBar(context, 2),
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(height: 30),
//             const CustomNavBar(),
//             const SizedBox(height: 10),

//             // 🔹 Cart Items List
//             Expanded(
//               child: ListView.builder(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 24,
//                   vertical: 16,
//                 ),
//                 itemCount: 3,
//                 itemBuilder: (context, index) {
//                   int quantity = 1;

//                   return StatefulBuilder(
//                     builder: (context, setState) {
//                       return Container(
//                         margin: const EdgeInsets.only(bottom: 20),
//                         padding: const EdgeInsets.all(16),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(16),
//                           boxShadow: const [
//                             BoxShadow(
//                               color: Colors.teal,
//                               blurRadius: 4,
//                               offset: Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         child: Row(
//                           children: [
//                             // Book Image
//                             Container(
//                               width: 80,
//                               height: 100,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 color: Colors.teal,
//                                 image: const DecorationImage(
//                                   image: AssetImage(
//                                     "assets/images/thespidy.jpg",
//                                   ),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 20),

//                             // Info
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text(
//                                     "Book Title",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 16,
//                                       color: MyColors.primary,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   const Text(
//                                     "Author Name",
//                                     style: TextStyle(color: Colors.deepOrange),
//                                   ),
//                                   const SizedBox(height: 8),

//                                   // Quantity
//                                   Row(
//                                     children: [
//                                       InkWell(
//                                         onTap: () {
//                                           if (quantity > 1)
//                                             setState(() => quantity--);
//                                         },
//                                         child: Container(
//                                           padding: const EdgeInsets.all(4),
//                                           decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             color: Colors.teal.shade300,
//                                           ),
//                                           child: const Icon(
//                                             Icons.remove,
//                                             size: 18,
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                           horizontal: 12,
//                                         ),
//                                         child: Text(
//                                           quantity.toString(),
//                                           style: const TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black54,
//                                           ),
//                                         ),
//                                       ),
//                                       InkWell(
//                                         onTap: () {
//                                           setState(() => quantity++);
//                                         },
//                                         child: Container(
//                                           padding: const EdgeInsets.all(4),
//                                           decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             color: Colors.teal.shade300,
//                                           ),
//                                           child: const Icon(
//                                             Icons.add,
//                                             size: 18,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),

//                             // Price + Delete
//                             Column(
//                               children: [
//                                 const Text(
//                                   "\$9.99",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.teal,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 InkWell(
//                                   onTap: () {
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       const SnackBar(
//                                         content: Text("Item removed"),
//                                       ),
//                                     );
//                                   },
//                                   child: const Icon(
//                                     Icons.delete,
//                                     color: Colors.red,
//                                     size: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButtonTheme(
//                   data: MyElevatedButtonTheme.lightElevatedButtonTheme,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => Checkout()),
//                       );
//                     },
//                     child: Text("Check Out"),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:bookify/screens/auth/users/sign_in.dart';
// import 'package:bookify/screens/checkout.dart';
// import 'package:bookify/utils/constants/colors.dart';
// import 'package:bookify/utils/themes/custom_themes/app_navbar.dart';
// import 'package:bookify/utils/themes/custom_themes/bottomnavbar.dart';
// import 'package:bookify/utils/themes/custom_themes/elevated_button_theme.dart';
// import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class CartItem {
//   final String title;
//   final String author;
//   final String imageUrl;
//   final double price;
//   int quantity;

//   CartItem({
//     required this.title,
//     required this.author,
//     required this.imageUrl,
//     required this.price,
//     this.quantity = 1,
//   });
// }

// class CartManager {
//   static final List<CartItem> _cartItems = [];

//   static List<CartItem> get cartItems => _cartItems;

//   static void addToCart(CartItem item) {
//     final existing = _cartItems.firstWhere(
//       (e) => e.title == item.title,
//       orElse: () => CartItem(title: '', author: '', imageUrl: '', price: 0),
//     );

//     if (existing.title != '') {
//       existing.quantity++;
//     } else {
//       _cartItems.add(item);
//     }
//   }

//   static void removeFromCart(CartItem item) {
//     _cartItems.remove(item);
//   }
// }

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   final auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     final cartItems = CartManager.cartItems;

//     return Scaffold(
//       backgroundColor: const Color(0xFFeeeeee),
//       bottomNavigationBar: buildCurvedNavBar(context, 2),
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(height: 30),
//             const CustomNavBar(),
//             const SizedBox(height: 10),

//             Expanded(
//               child: cartItems.isEmpty
//                   ? const Center(child: Text("Your cart is empty"))
//                   : ListView.builder(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 24,
//                         vertical: 16,
//                       ),
//                       itemCount: cartItems.length,
//                       itemBuilder: (context, index) {
//                         final item = cartItems[index];

//                         return StatefulBuilder(
//                           builder: (context, setState) {
//                             return Container(
//                               margin: const EdgeInsets.only(bottom: 20),
//                               padding: const EdgeInsets.all(16),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(16),
//                                 boxShadow: const [
//                                   BoxShadow(
//                                     color: Colors.teal,
//                                     blurRadius: 4,
//                                     offset: Offset(0, 2),
//                                   ),
//                                 ],
//                               ),
//                               child: Row(
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
//                                   const SizedBox(width: 20),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           item.title,
//                                           style: const TextStyle(
//                                             fontWeight: FontWeight.w600,
//                                             fontSize: 16,
//                                             color: MyColors.primary,
//                                           ),
//                                         ),
//                                         const SizedBox(height: 4),
//                                         Text(
//                                           item.author,
//                                           style: const TextStyle(
//                                             color: Colors.deepOrange,
//                                           ),
//                                         ),
//                                         const SizedBox(height: 8),
//                                         Row(
//                                           children: [
//                                             InkWell(
//                                               onTap: () {
//                                                 if (item.quantity > 1) {
//                                                   setState(
//                                                     () => item.quantity--,
//                                                   );
//                                                 }
//                                               },
//                                               child: Container(
//                                                 padding: const EdgeInsets.all(
//                                                   4,
//                                                 ),
//                                                 decoration: BoxDecoration(
//                                                   shape: BoxShape.circle,
//                                                   color: Colors.teal.shade300,
//                                                 ),
//                                                 child: const Icon(
//                                                   Icons.remove,
//                                                   size: 18,
//                                                 ),
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                     horizontal: 12,
//                                                   ),
//                                               child: Text(
//                                                 item.quantity.toString(),
//                                                 style: const TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.black54,
//                                                 ),
//                                               ),
//                                             ),
//                                             InkWell(
//                                               onTap: () {
//                                                 setState(() => item.quantity++);
//                                               },
//                                               child: Container(
//                                                 padding: const EdgeInsets.all(
//                                                   4,
//                                                 ),
//                                                 decoration: BoxDecoration(
//                                                   shape: BoxShape.circle,
//                                                   color: Colors.teal.shade300,
//                                                 ),
//                                                 child: const Icon(
//                                                   Icons.add,
//                                                   size: 18,
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Column(
//                                     children: [
//                                       Text(
//                                         "\$${(item.price * item.quantity).toStringAsFixed(2)}",
//                                         style: const TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.teal,
//                                         ),
//                                       ),
//                                       const SizedBox(height: 8),
//                                       InkWell(
//                                         onTap: () {
//                                           setState(
//                                             () => CartManager.removeFromCart(
//                                               item,
//                                             ),
//                                           );
//                                           ScaffoldMessenger.of(
//                                             context,
//                                           ).showSnackBar(
//                                             const SnackBar(
//                                               content: Text("Item removed"),
//                                             ),
//                                           );
//                                         },
//                                         child: const Icon(
//                                           Icons.delete,
//                                           color: Colors.red,
//                                           size: 22,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         );
//                       },
//                     ),
//             ),

//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButtonTheme(
//                   data: MyElevatedButtonTheme.lightElevatedButtonTheme,
//                   child: ElevatedButton(
//                     onPressed: cartItems.isEmpty
//                         ? null
//                         : () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const Checkout(),
//                               ),
//                             );
//                           },
//                     child: const Text("Check Out"),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:bookify/models/cart_item.dart';
// import 'package:bookify/managers/cart_manager.dart';
// import 'package:bookify/screens/checkout.dart';
// import 'package:bookify/utils/constants/colors.dart';
// import 'package:bookify/utils/themes/custom_themes/app_navbar.dart';
// import 'package:bookify/utils/themes/custom_themes/bottomnavbar.dart';
// import 'package:bookify/utils/themes/custom_themes/elevated_button_theme.dart';
// import 'package:flutter/material.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final cartItems = CartManager.cartItems;

//     return Scaffold(
//       backgroundColor: const Color(0xFFeeeeee),
//       bottomNavigationBar: buildCurvedNavBar(context, 2),
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(height: 30),
//             const CustomNavBar(),
//             const SizedBox(height: 10),

//             // 🛒 Cart List or Empty State
//             Expanded(
//               child: cartItems.isEmpty
//                   ? const Center(
//                       child: Text(
//                         "No item selected",
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
//                       itemCount: cartItems.length,
//                       itemBuilder: (context, index) {
//                         final item = cartItems[index];

//                         return Container(
//                           margin: const EdgeInsets.only(bottom: 20),
//                           padding: const EdgeInsets.all(16),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(16),
//                             boxShadow: const [
//                               BoxShadow(
//                                 color: Colors.teal,
//                                 blurRadius: 4,
//                                 offset: Offset(0, 2),
//                               ),
//                             ],
//                           ),
//                           child: Row(
//                             children: [
//                               // 📕 Image
//                               Container(
//                                 width: 80,
//                                 height: 100,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(8),
//                                   image: DecorationImage(
//                                     image: NetworkImage(item.imageUrl),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: 20),

//                               // 📘 Info
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
//                                     Row(
//                                       children: [
//                                         InkWell(
//                                           onTap: () {
//                                             if (item.quantity > 1) {
//                                               setState(() => item.quantity--);
//                                             }
//                                           },
//                                           child: Container(
//                                             padding: const EdgeInsets.all(4),
//                                             decoration: BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               color: Colors.teal.shade300,
//                                             ),
//                                             child: const Icon(Icons.remove, size: 18),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(horizontal: 12),
//                                           child: Text(
//                                             item.quantity.toString(),
//                                             style: const TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black54,
//                                             ),
//                                           ),
//                                         ),
//                                         InkWell(
//                                           onTap: () {
//                                             setState(() => item.quantity++);
//                                           },
//                                           child: Container(
//                                             padding: const EdgeInsets.all(4),
//                                             decoration: BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               color: Colors.teal.shade300,
//                                             ),
//                                             child: const Icon(Icons.add, size: 18),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),

//                               // 💰 Price + Delete
//                               Column(
//                                 children: [
//                                   Text(
//                                     "\$${(item.price * item.quantity).toStringAsFixed(2)}",
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.teal,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 8),
//                                   InkWell(
//                                     onTap: () {
//                                       CartManager.removeFromCart(item);
//                                       setState(() {});
//                                       ScaffoldMessenger.of(context).showSnackBar(
//                                         const SnackBar(content: Text("Item removed")),
//                                       );
//                                     },
//                                     child: const Icon(Icons.delete, color: Colors.red, size: 22),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//             ),

//             // ✅ Checkout Button Only if Items Exist
//             if (cartItems.isNotEmpty)
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButtonTheme(
//                     data: MyElevatedButtonTheme.lightElevatedButtonTheme,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const Checkout()),
//                         );
//                       },
//                       child: const Text("Check Out"),
//                     ),
//                   ),
//                 ),
//               ),
//             if (cartItems.isNotEmpty) const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:bookify/models/cart_item.dart';
import 'package:bookify/managers/cart_manager.dart';
import 'package:bookify/screens/checkout.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/app_navbar.dart';
import 'package:bookify/utils/themes/custom_themes/bottomnavbar.dart';
import 'package:bookify/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeeeeee),
      bottomNavigationBar: buildCurvedNavBar(context, 2),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const CustomNavBar(),
            const SizedBox(height: 10),

            /// 🔁 Cart Stream from Firestore
            Expanded(
              child: StreamBuilder<List<CartItem>>(
                stream: CartManager.getCartStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final cartItems = snapshot.data ?? [];

                  if (cartItems.isEmpty) {
                    return const Center(
                      child: Text(
                        "No item selected",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }

                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            final item = cartItems[index];

                            return Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.teal,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  // 🖼 Book Image
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
                                  const SizedBox(width: 20),

                                  // 📕 Book Info
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          style: const TextStyle(
                                            color: Colors.deepOrange,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (item.quantity > 1) {
                                                  CartManager.updateQuantity(
                                                    item.bookId,
                                                    item.quantity - 1,
                                                  );
                                                }
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.all(
                                                  4,
                                                ),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.teal.shade300,
                                                ),
                                                child: const Icon(
                                                  Icons.remove,
                                                  size: 18,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                  ),
                                              child: Text(
                                                item.quantity.toString(),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                CartManager.updateQuantity(
                                                  item.bookId,
                                                  item.quantity + 1,
                                                );
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.all(
                                                  4,
                                                ),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.teal.shade300,
                                                ),
                                                child: const Icon(
                                                  Icons.add,
                                                  size: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  // 💰 Price + Delete
                                  Column(
                                    children: [
                                      Text(
                                        "\$${(item.price * item.quantity).toStringAsFixed(2)}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      InkWell(
                                        onTap: () {
                                          CartManager.removeFromCart(
                                            item.bookId,
                                          );
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text("Item removed"),
                                            ),
                                          );
                                        },
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 22,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      // ✅ Show Checkout Button when cart is not empty
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButtonTheme(
                            data:
                                MyElevatedButtonTheme.lightElevatedButtonTheme,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Checkout(),
                                  ),
                                );
                              },
                              child: const Text("Check Out"),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
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
