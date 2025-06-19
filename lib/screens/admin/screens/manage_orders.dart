import 'package:bookify/utils/themes/custom_themes/adminbottomnavbar.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class ManageOrders extends StatefulWidget {
  const ManageOrders({super.key});

  @override
  State<ManageOrders> createState() => _ManageOrdersState();
}

class _ManageOrdersState extends State<ManageOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeeeeee),
      bottomNavigationBar: buildAdminCurvedNavBar(context, 3),
      body: SafeArea(
        child: Column(
          children: [
            Text("Manage Orders", style: MyTextTheme.lightTextTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}