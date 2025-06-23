import 'package:bookify/screens/auth/users/sign_in.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserOrders extends StatefulWidget {
  const UserOrders({super.key});

  @override
  State<UserOrders> createState() => _UserOrdersState();
}

class _UserOrdersState extends State<UserOrders> {
  bool _showSearchBar = false;
  final TextEditingController _searchController = TextEditingController();
  final auth = FirebaseAuth.instance;

  // Dummy orders data
  List<Map<String, dynamic>> userOrders = [
    {
      'orderId': 'ORD12345',
      'date': '2025-06-20',
      'total': 145.50,
      'status': 'Delivered',
      'books': [
        {'title': 'Atomic Habits', 'qty': 1},
        {'title': 'The Alchemist', 'qty': 2},
      ],
    },
    {
      'orderId': 'ORD12346',
      'date': '2025-06-18',
      'total': 72.00,
      'status': 'Processing',
      'books': [
        {'title': 'The Art of War', 'qty': 1},
      ],
    },
  ];

  void cancelOrder(int index) {
    setState(() {
      userOrders[index]['status'] = 'Cancelled';
    });
    // TODO: Add backend update call here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeeeeee),
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
                    onTap: () =>
                        setState(() => _showSearchBar = !_showSearchBar),
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
                    hintText: "Search your orders...",
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
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Your Orders",
                style: TextStyle(
                  color: MyColors.primary,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: userOrders.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  final order = userOrders[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.only(bottom: 16),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Order ID:",
                                style: MyTextTheme.lightTextTheme.bodyLarge,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                order['orderId'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Chip(
                                backgroundColor: order['status'] == 'Delivered'
                                    ? Colors.green.shade100
                                    : order['status'] == 'Cancelled'
                                    ? Colors.red.shade100
                                    : Colors.orange.shade100,
                                label: Text(
                                  order['status'],
                                  style: TextStyle(
                                    color: order['status'] == 'Delivered'
                                        ? Colors.green
                                        : order['status'] == 'Cancelled'
                                        ? Colors.red
                                        : Colors.orange,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Date: ${order['date']}",
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 12),

                          // Book List
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(order['books'].length, (i) {
                              final book = order['books'][i];
                              return Text(
                                "• ${book['title']} x${book['qty']}",
                                style: const TextStyle(fontSize: 14),
                              );
                            }),
                          ),

                          const SizedBox(height: 12),
                          Text(
                            "Total: \$${order['total'].toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColors.primary,
                              fontSize: 16,
                            ),
                          ),

                          // Cancel Button (only if not delivered/cancelled)
                          if (order['status'] != 'Delivered' &&
                              order['status'] != 'Cancelled')
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton.icon(
                                onPressed: () => cancelOrder(index),
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                ),
                                label: const Text(
                                  "Cancel Order",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
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
