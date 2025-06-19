import 'package:bookify/utils/themes/custom_themes/adminbottomnavbar.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class ManageUsers extends StatefulWidget {
  const ManageUsers({super.key});

  @override
  State<ManageUsers> createState() => _ManageUsersState();
}

class _ManageUsersState extends State<ManageUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeeeeee),
      bottomNavigationBar: buildAdminCurvedNavBar(context, 2),
      body: SafeArea(
        child: Column(
          children: [
            Text("Manage Users", style: MyTextTheme.lightTextTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
