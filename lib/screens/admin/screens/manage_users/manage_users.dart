// import 'package:bookify/screens/auth/users/sign_in.dart';
// import 'package:bookify/utils/constants/colors.dart';
// import 'package:bookify/utils/themes/custom_themes/adminbottomnavbar.dart';
// import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class ManageUsers extends StatefulWidget {
//   const ManageUsers({super.key});

//   @override
//   State<ManageUsers> createState() => _ManageUsersState();
// }

// class _ManageUsersState extends State<ManageUsers> {
//   final auth = FirebaseAuth.instance;
//   bool _showSearchBar = false;
//   final TextEditingController _searchController = TextEditingController();

//   // ✅ Sample user list
//   List<Map<String, dynamic>> users = [
//     {
//       'id': 'U001',
//       'name': 'Shariq Najam',
//       'email': 'shariq@example.com',
//       'imagePath': 'assets/images/b.jpg',
//       'enabled': true,
//     },
//     {
//       'id': 'U002',
//       'name': 'Fatima Zahra',
//       'email': 'fatima.zahra@example.com',
//       'imagePath': 'assets/images/b.jpg',
//       'enabled': false,
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFeeeeee),
//       bottomNavigationBar: buildAdminCurvedNavBar(context, 2),
//       body: SafeArea(
//         child: SingleChildScrollView(
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
//               const SizedBox(height: 30),
//               Center(
//                 child: Text(
//                   "Manage Users",
//                   style: TextStyle(
//                     color: MyColors.primary,
//                     fontSize: 22,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Table(
//                   border: TableBorder.all(color: MyColors.primary),
//                   columnWidths: const {
//                     0: FlexColumnWidth(1.2),
//                     1: FlexColumnWidth(2),
//                     2: FlexColumnWidth(3),
//                     3: FlexColumnWidth(2),
//                     4: FlexColumnWidth(2),
//                   },
//                   children: [
//                     // Header row
//                     TableRow(
//                       decoration: const BoxDecoration(color: Colors.teal),
//                       children: [
//                         _buildTableHeader("ID"),
//                         _buildTableHeader("Name"),
//                         _buildTableHeader("Email"),
//                         _buildTableHeader("Image"),
//                         _buildTableHeader("Action"),
//                       ],
//                     ),
//                     // Dynamic user rows
//                     for (int i = 0; i < users.length; i++) _buildUserRow(i),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Header Cell
//   TableCell _buildTableHeader(String text) {
//     return TableCell(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8),
//         child: Center(
//           child: Text(
//             text,
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // User Row
//   TableRow _buildUserRow(int index) {
//     var user = users[index];
//     return TableRow(
//       children: [
//         _buildTableCell(user['id']),
//         _buildTableCell(user['name']),
//         _buildTableCell(user['email']),
//         TableCell(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 8),
//             child: Center(
//               child: CircleAvatar(
//                 backgroundImage: AssetImage(user['imagePath']),
//                 radius: 20,
//               ),
//             ),
//           ),
//         ),
//         TableCell(
//           child: Center(
//             child: Switch(
//               value: user['enabled'],
//               activeColor: Colors.teal,
//               onChanged: (val) {
//                 setState(() {
//                   users[index]['enabled'] = val;
//                 });
//                 // TODO: Sync status to backend
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   // Cell Text
//   TableCell _buildTableCell(String text) {
//     return TableCell(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 12),
//         child: Center(
//           child: Text(text, style: const TextStyle(color: Colors.teal)),
//         ),
//       ),
//     );
//   }
// }

import 'package:bookify/screens/auth/users/sign_in.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/adminbottomnavbar.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ManageUsers extends StatefulWidget {
  const ManageUsers({super.key});

  @override
  State<ManageUsers> createState() => _ManageUsersState();
}

class _ManageUsersState extends State<ManageUsers> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _showSearchBar = false;
  final TextEditingController _searchController = TextEditingController();
  List<DocumentSnapshot> _users = [];
  List<DocumentSnapshot> _filteredUsers = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
    _searchController.addListener(_onSearchChanged);
  }

  void fetchUsers() async {
    final querySnapshot = await _firestore.collection('users').get();
    setState(() {
      _users = querySnapshot.docs;
      _filteredUsers = _users;
    });
  }

  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredUsers = _users.where((user) {
        final data = user.data() as Map<String, dynamic>;
        final name = (data['name'] ?? '').toString().toLowerCase();
        final email = (data['email'] ?? '').toString().toLowerCase();
        return name.contains(query) || email.contains(query);
      }).toList();
    });
  }

  void toggleUserStatus(String uid, bool status) async {
    await _firestore.collection('users').doc(uid).update({'enabled': status});
    fetchUsers();
  }

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
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/b.jpg"),
                      radius: 20,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, Admin",
                          style: MyTextTheme.lightTextTheme.titleLarge,
                        ),
                        const Text(
                          "Administrator",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(Icons.search_rounded, color: MyColors.primary),
                      onPressed: () =>
                          setState(() => _showSearchBar = !_showSearchBar),
                    ),
                    IconButton(
                      icon: Icon(Icons.logout, color: MyColors.primary),
                      onPressed: () async {
                        await _auth.signOut();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const SignIn()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              if (_showSearchBar)
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Search...",
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
                    TableRow(
                      decoration: const BoxDecoration(color: Colors.teal),
                      children: [
                        "ID",
                        "Name",
                        "Email",
                        "Image",
                        "Action",
                      ].map((header) => _buildTableHeader(header)).toList(),
                    ),
                    for (var user in _filteredUsers) _buildUserRow(user),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildUserRow(DocumentSnapshot user) {
    final data = user.data() as Map<String, dynamic>;
    final name = data['name'] ?? 'No Name';
    final email = data['email'] ?? 'No Email';
    final imagePath = data['imagePath'] ?? 'assets/images/b.jpg';
    final enabled = data['enabled'] ?? true;

    return TableRow(
      children: [
        _buildTableCell(user.id),
        _buildTableCell(name),
        _buildTableCell(email),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(imagePath),
                radius: 20,
              ),
            ),
          ),
        ),
        TableCell(
          child: Center(
            child: Switch(
              value: enabled,
              onChanged: (val) => toggleUserStatus(user.id, val),
              activeColor: Colors.teal,
            ),
          ),
        ),
      ],
    );
  }

  TableCell _buildTableHeader(String text) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

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
