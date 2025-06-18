import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class ManageBooks extends StatefulWidget {
  const ManageBooks({super.key});

  @override
  State<ManageBooks> createState() => _ManageBooksState();
}

class _ManageBooksState extends State<ManageBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeeeeee),
      body: SafeArea(
        child: Column(
          children: [
            Text("Manage Books", style: MyTextTheme.lightTextTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
