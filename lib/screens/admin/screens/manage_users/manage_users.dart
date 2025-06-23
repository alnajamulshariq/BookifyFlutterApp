import 'package:bookify/screens/auth/users/sign_in.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/adminbottomnavbar.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ManageUsers extends StatefulWidget {
  const ManageUsers({super.key});

  @override
  State<ManageUsers> createState() => _ManageUsersState();
}

class _ManageUsersState extends State<ManageUsers> {
  final auth = FirebaseAuth.instance;
  bool _showSearchBar = false;
  final TextEditingController _searchController = TextEditingController();

  // ✅ Sample user list
  List<Map<String, dynamic>> users = [
    {
      'id': 'U001',
      'name': 'Shariq Najam',
      'email': 'shariq@example.com',
      'imagePath': 'assets/images/b.jpg',
      'enabled': true,
    },
    {
      'id': 'U002',
      'name': 'Fatima Zahra',
      'email': 'fatima.zahra@example.com',
      'imagePath': 'assets/images/b.jpg',
      'enabled': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeeeeee),
      bottomNavigationBar: buildAdminCurvedNavBar(context, 2),
      body: SafeArea(
        child: SingleChildScrollView(
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
              const SizedBox(height: 30),
              Center(
                child: Text(
                  "Manage Users",
                  style: TextStyle(
                    color: MyColors.primary,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Table(
                  border: TableBorder.all(color: MyColors.primary),
                  columnWidths: const {
                    0: FlexColumnWidth(1.2),
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(3),
                    3: FlexColumnWidth(2),
                    4: FlexColumnWidth(2),
                  },
                  children: [
                    // Header row
                    TableRow(
                      decoration: const BoxDecoration(color: Colors.teal),
                      children: [
                        _buildTableHeader("ID"),
                        _buildTableHeader("Name"),
                        _buildTableHeader("Email"),
                        _buildTableHeader("Image"),
                        _buildTableHeader("Action"),
                      ],
                    ),
                    // Dynamic user rows
                    for (int i = 0; i < users.length; i++) _buildUserRow(i),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Header Cell
  TableCell _buildTableHeader(String text) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  // User Row
  TableRow _buildUserRow(int index) {
    var user = users[index];
    return TableRow(
      children: [
        _buildTableCell(user['id']),
        _buildTableCell(user['name']),
        _buildTableCell(user['email']),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(user['imagePath']),
                radius: 20,
              ),
            ),
          ),
        ),
        TableCell(
          child: Center(
            child: Switch(
              value: user['enabled'],
              activeColor: Colors.teal,
              onChanged: (val) {
                setState(() {
                  users[index]['enabled'] = val;
                });
                // TODO: Sync status to backend
              },
            ),
          ),
        ),
      ],
    );
  }

  // Cell Text
  TableCell _buildTableCell(String text) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Center(
          child: Text(text, style: const TextStyle(color: Colors.teal)),
        ),
      ),
    );
  }
}
