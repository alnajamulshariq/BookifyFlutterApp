import 'package:bookify/screens/auth/users/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:bookify/utils/themes/themes.dart';

void main() {
  runApp(const FlutterApp());
}

class FlutterApp extends StatelessWidget {
  const FlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookify',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      home: const SignIn(),
    );
  }
}
