import 'dart:typed_data';

import 'package:bookify/screens/profile.dart';
import 'package:bookify/utils/themes/custom_themes/app_navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bookify/screens/auth/users/sign_in.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final auth = FirebaseAuth.instance;
  final _storageSupabase = Supabase.instance.client.storage.from("images");

  // Data variables to hold fetched data
  String name = '';
  String email = '';
  String contact = '';
  String address = '';
  String profileImage = '';

  Uint8List? _imageBytes;
  String? _image;

  final _formKey = GlobalKey<FormState>();

  // Initialize TextEditingControllers for each field
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      try {
        final doc = await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .get();
        final data = doc.data();

        if (data != null) {
          setState(() {
            name = data['name'] ?? '';
            email = data['email'] ?? '';
            contact = data['phone'] ?? '';
            address = data['address'] ?? '';
            profileImage = data['profile_image_url'] ?? '';

            // Initialize the text controllers with fetched data
            nameController.text = name;
            emailController.text = email;
            contactController.text = contact;
            addressController.text = address;
          });
        }
      } catch (e) {
        print("Error fetching profile: $e");
      }
    }
  }

  // Function to pick image from gallery or camera
  final picker = ImagePicker();
  Future getProfileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
        _image = pickedFile.name;
      });
    } else {
      print("No Image Selected");
    }
  }

  Future<String?> uploadImage(Uint8List imageBytes, String imageName) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        print("No authenticated Firebase user");
        return null;
      }

      // 1. Upload to Supabase Storage
      final fileName =
          'bkfy_${DateTime.now().microsecondsSinceEpoch}_$imageName';
      final response = await _storageSupabase.uploadBinary(
        fileName,
        imageBytes,
        fileOptions: FileOptions(cacheControl: '3600', upsert: false),
      );

      if (response.isNotEmpty) {
        // 2. Get public URL
        final imageUrl = _storageSupabase.getPublicUrl(fileName);
        print("Image Uploaded Successfully");

        // 3. Update Supabase Database
        try {
          await Supabase.instance.client.from('user_profiles').upsert({
            'firebase_uid': user.uid,
            'profile_image_url': imageUrl,
            'updated_at': DateTime.now().toIso8601String(),
          });
          print("Supabase profile updated");
        } catch (e) {
          print("Supabase DB update error: $e");
        }

        // 4. Update Firestore (optional)
        try {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .update({
                'profile_image_url': imageUrl,
                'updated_at': FieldValue.serverTimestamp(),
              });
          print("Firestore profile updated");
        } catch (e) {
          print("Firestore update error: $e");
        }

        return imageUrl;
      } else {
        print("Image Upload Failed - Empty response");
        return null;
      }
    } catch (e) {
      print("Upload Error: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeeeeee),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 30),
              const CustomNavBar(),
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
                      child: _imageBytes != null
                          ? Image.memory(
                              _imageBytes!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            )
                          : const Icon(
                              Icons.person,
                              size: 100,
                              color: Colors.grey,
                            ),
                    ),
                    // Camera Icon (on top of the circle)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          getProfileImage();
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.teal, width: 2),
                          ),
                          child: Icon(
                            Icons.camera_alt,
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
                  controller: nameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    labelText: "Full Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Name is required";
                    } else if (value.length < 3) {
                      return "Name must be at least 3 characters";
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: contactController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone),
                    labelText: "Phone Number",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: addressController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.home),
                    labelText: "Address",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: MyElevatedButtonTheme.lightElevatedButtonTheme.style,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        String? uploadImageUrl;
                        if (_imageBytes != null && _image != null) {
                          uploadImageUrl = await uploadImage(
                            _imageBytes!,
                            _image!,
                          );
                        }

                        final uid = FirebaseAuth.instance.currentUser?.uid;
                        if (uid != null) {
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(uid)
                              .update({
                                'name': nameController.text,
                                'email': emailController.text,
                                'phone': contactController.text,
                                'address': addressController.text,
                                if (uploadImageUrl != null)
                                  'profile_image_url': uploadImageUrl,
                              });

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Profile updated successfully"),
                            ),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ),
                          );
                        }
                      }
                    },
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
