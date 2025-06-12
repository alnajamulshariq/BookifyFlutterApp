import 'package:bookify/utils/themes/custom_themes/bottomnavbar.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeeeeee),
      bottomNavigationBar: buildCurvedNavBar(context, 4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: Text(
                "Profile Page",
                style: MyTextTheme.lightTextTheme.headlineMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}