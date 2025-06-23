import 'package:bookify/screens/auth/users/sign_in.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/adminbottomnavbar.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ManageOrders extends StatefulWidget {
  const ManageOrders({super.key});

  @override
  State<ManageOrders> createState() => _ManageOrdersState();
}

class _ManageOrdersState extends State<ManageOrders> {
  final auth = FirebaseAuth.instance;
  bool _showSearchBar = false;
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, dynamic>> orders = [
    {
      'orderId': 'ORD001',
      'userName': 'Shariq Najam',
      'userImage': 'assets/images/b.jpg',
      'total': 120.00,
      'status': 'Processing',
    },
    {
      'orderId': 'ORD002',
      'userName': 'Fatima Zahra',
      'userImage': 'assets/images/b.jpg',
      'total': 78.50,
      'status': 'Shipped',
    },
    {
      'orderId': 'ORD003',
      'userName': 'Kinza Khan',
      'userImage': 'assets/images/b.jpg',
      'total': 250.99,
      'status': 'Delivered',
    },
  ];

  List<String> statusOptions = [
    'Processing',
    'Shipped',
    'Delivered',
    'Cancelled',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeeeeee),
      bottomNavigationBar: buildAdminCurvedNavBar(context, 3),
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
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Center(
                child: Text(
                  "Manage Orders",
                  style: TextStyle(
                    color: MyColors.primary,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Order ID & Dropdown
                          Row(
                            children: [
                              Text(
                                "Order ID: ",
                                style: MyTextTheme.lightTextTheme.bodyLarge,
                              ),
                              Text(
                                order['orderId'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              const Spacer(),
                              DropdownButton<String>(
                                value: order['status'],
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.teal,
                                ),
                                style: const TextStyle(color: Colors.teal),
                                dropdownColor: Colors.white,
                                underline: Container(),
                                items: statusOptions
                                    .map(
                                      (status) => DropdownMenuItem<String>(
                                        value: status,
                                        child: Text(status),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (newStatus) {
                                  setState(() {
                                    order['status'] = newStatus!;
                                  });
                                  // TODO: Sync status change to backend
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // User Info
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(order['userImage']),
                                radius: 20,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                order['userName'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          // Price
                          Text(
                            "Total Price: \$${order['total'].toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColors.primary,
                              fontSize: 16,
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
