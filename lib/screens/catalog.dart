import 'package:bookify/utils/themes/custom_themes/bottomnavbar.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeeeeee),
      bottomNavigationBar: buildCurvedNavBar(context, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: Text(
                "Category Page",
                style: MyTextTheme.lightTextTheme.headlineMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
