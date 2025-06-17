import 'package:image_picker/image_picker.dart';
import 'package:bookify/screens/auth/users/sign_in.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool _showSearchBar = false;
  final TextEditingController _searchController = TextEditingController();
  final auth = FirebaseAuth.instance;

  // Static Data for Profile
  String name = "Shariq";
  String email = "shariq@example.com";
  String contact = "+92 300 1234567";
  String address = "Karachi, Pakistan";
  String profileImage = "assets/images/b.jpg"; // Default image

  final ImagePicker _picker = ImagePicker();

  final _formKey = GlobalKey<FormState>(); // Form Key

  // Function to pick image from gallery or camera
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera, // Or use ImageSource.gallery for gallery
    );
    if (pickedFile != null) {
      setState(() {
        profileImage = pickedFile.path; // Update the profile image path
      });
    }
  }

  // Submit form
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process data
      print('Form Submitted!');
    } else {
      print('Validation failed!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeeeeee),
      body: SafeArea(
        child: Form(
          key: _formKey, // Set the form key
          child: Column(
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        profileImage, // Path to your profile image
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
                          "Hi, Shariq",
                          style: MyTextTheme.lightTextTheme.titleLarge,
                        ),
                        const Text(
                          "Have a nice day",
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
                            MaterialPageRoute(builder: (context) => SignIn()),
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
              const SizedBox(height: 10),

              Center(
                child: Text(
                  "Edit Profile",
                  style: MyTextTheme.lightTextTheme.headlineMedium?.copyWith(
                    color: MyColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Profile Image & Camera Icon
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Stack(
                  clipBehavior:
                      Clip.none, // Allows the icon to overflow the circle
                  children: [
                    // Circular Profile Image
                    ClipOval(
                      child: Image.asset(
                        profileImage, // Path to your profile image
                        width: 100, // Width of the circular image
                        height: 100, // Height of the circular image
                        fit: BoxFit
                            .cover, // Ensures the image fits inside the circle
                      ),
                    ),

                    // Camera Icon (on top of the circle)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage, // Call _pickImage to upload
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.teal, width: 2),
                          ),
                          child: Icon(
                            Icons.camera_alt, // Camera icon
                            color: Colors.teal,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Form fields for profile data
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: name,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Full Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Name is required";
                    } else if (value.length < 3) {
                      return "Name must be of 3 characters";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: email,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Email",
                    border: OutlineInputBorder(),
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
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: address,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.home),
                    labelText: "Address",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Address is required";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      address = value;
                    });
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: contact,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: "Phone Number",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Phone number is required";
                    final phoneRegex = RegExp(r"^(?:\+92|0092|92)?3[0-9]{9}$");
                    if (!phoneRegex.hasMatch(value))
                      return "Enter a valid Pakistani phone number";
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      contact = value;
                    });
                  },
                ),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: MyElevatedButtonTheme.lightElevatedButtonTheme.style,
                    onPressed: _submitForm,
                    child: const Text('Save Changes'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
