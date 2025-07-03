import 'package:bookify/models/cart_item.dart';
import 'package:bookify/managers/cart_manager.dart';
import 'package:bookify/screens/home.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/app_navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final auth = FirebaseAuth.instance;
  List<CartItem> cartItems = [];
  double deliveryCharge = 2.0;
  String userAddress = "Loading address...";

  @override
  void initState() {
    super.initState();
    _loadCart();
    _loadUserAddress();
  }

  Future<void> _loadCart() async {
    CartManager.getCartStream().listen((items) {
      setState(() {
        cartItems = items;
      });
    });
  }

  Future<void> _loadUserAddress() async {
    final uid = auth.currentUser?.uid;
    if (uid != null) {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();
      if (doc.exists && doc.data()!.containsKey('address')) {
        setState(() {
          userAddress = doc['address'];
        });
      } else {
        setState(() {
          userAddress = "No address found. Please update your profile.";
        });
      }
    }
  }

  double get itemsTotal =>
      cartItems.fold(0.0, (total, item) => total + item.price * item.quantity);
  double get totalAmount => itemsTotal + deliveryCharge;

  Future<void> _placeOrder() async {
    final uid = auth.currentUser?.uid;
    if (uid == null || cartItems.isEmpty) return;

    final orderData = {
      'userId': uid,
      'orderDate': Timestamp.now(),
      'items': cartItems.map((e) => e.toMap()).toList(),
      'itemsTotal': itemsTotal,
      'deliveryCharge': deliveryCharge,
      'totalAmount': totalAmount,
      'shippingAddress': userAddress,
    };

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('orders')
          .add(orderData);

      // Clear cart
      for (final item in cartItems) {
        await CartManager.removeFromCart(item.bookId);
      }

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Order placed successfully!")),
      );

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed to place order: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeeeeee),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 30),
                const CustomNavBar(),
                const SizedBox(height: 60),

                /// 🔹 Dynamic Address Box
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.teal.shade200,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      userAddress,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// 🔹 Order Summary
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.teal.shade200,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _summaryRow(
                          "Items Total",
                          "\$${itemsTotal.toStringAsFixed(2)}",
                        ),
                        const SizedBox(height: 10),
                        _summaryRow(
                          "Delivery Charges",
                          "\$${deliveryCharge.toStringAsFixed(2)}",
                        ),
                        const Divider(height: 20),
                        _summaryRow(
                          "Total",
                          "\$${totalAmount.toStringAsFixed(2)}",
                          bold: true,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 90),
              ],
            ),

            /// ✅ Place Order Button
            Positioned(
              bottom: 16,
              left: 24,
              right: 24,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: cartItems.isEmpty ? null : _placeOrder,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Place Order",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _summaryRow(String label, String value, {bool bold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: MyColors.primary,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.teal,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
