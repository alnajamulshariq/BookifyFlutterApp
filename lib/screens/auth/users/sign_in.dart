import 'package:bookify/screens/auth/users/forgetpass.dart';
import 'package:bookify/screens/auth/users/sign_up.dart';
import 'package:bookify/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:bookify/utils/themes/custom_themes/outlined_button_theme.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:bookify/utils/constants/colors.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: MyColors.primary,
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/appLogo2.png',
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 220,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: MyColors.bg,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(34),
                  topRight: Radius.circular(34),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 10),

                      // Email Field
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: const TextStyle(color: Colors.black),
                        decoration: _inputDecoration(
                          label: 'Email',
                          hint: 'Enter your email',
                          icon: Icons.email,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Email is required";
                          final emailRegex = RegExp(
                            r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                          );
                          if (!emailRegex.hasMatch(value))
                            return "Enter a valid email address";
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      // Password Field
                      TextFormField(
                        controller: passController,
                        obscureText: _obscurePassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: const TextStyle(color: Colors.black),
                        decoration:
                            _inputDecoration(
                              label: 'Password',
                              hint: 'Enter your password',
                              icon: Icons.lock,
                            ).copyWith(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                            ),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Password is required";
                          final passRegex = RegExp(
                            r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                          );
                          if (!passRegex.hasMatch(value)) {
                            return "Password must be at least 8 chars (upper, lower, digit, special)";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ForgetPass(),
                              ),
                            ),
                            child: Text(
                              "Forget Password",
                              style: TextStyle(
                                color: MyColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButtonTheme(
                          data: MyElevatedButtonTheme.lightElevatedButtonTheme,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState?.validate() ?? false) {
                                // Handle login
                              }
                            },
                            child: const Text('Login'),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          const Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                              endIndent: 10,
                            ),
                          ),
                          const Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                              indent: 10,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButtonTheme(
                          data: MyOutlinedButtonTheme.lightOutlinedButtonTheme,
                          child: OutlinedButton(
                            onPressed: () {
                              // Google Login
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.all(18),
                              side: const BorderSide(color: MyColors.primary),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Transform.scale(
                                    scale: 1.7,
                                    child: Image.asset(
                                      'assets/images/googleIcon.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'Continue with Google',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    letterSpacing: 0.7,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: MyTextTheme.lightTextTheme.bodySmall,
                          ),
                          InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const SignUp()),
                            ),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: MyColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(color: Colors.black),
      hintStyle: const TextStyle(color: Colors.grey),
      prefixIcon: Icon(icon, color: Colors.grey),
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: MyColors.primary, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: MyColors.primary, width: 2),
      ),
    );
  }
}
