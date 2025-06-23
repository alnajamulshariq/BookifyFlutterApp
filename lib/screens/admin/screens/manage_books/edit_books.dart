import 'dart:io';
import 'package:bookify/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:bookify/screens/auth/users/sign_in.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditBooks extends StatefulWidget {
  const EditBooks({super.key});

  @override
  State<EditBooks> createState() => _EditBooksState();
}

class _EditBooksState extends State<EditBooks> {
  bool _showSearchBar = false;
  final TextEditingController _searchController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final authorController = TextEditingController();
  final descriptionController = TextEditingController();
  String? selectedValue;
  File? _selectedImage;

  final List<String> categories = [
    "Featured",
    "Popular",
    "Best Selling",
    "Novels",
    "Self Love",
    "Action",
    "History",
    "Fantasy",
    "Romance",
    "Science",
    "Poetry",
    "All Books",
  ];

  Future<void> _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeeeeee),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            // ✅ Fixed Navbar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      "assets/images/b.jpg",
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
                    onTap: () =>
                        setState(() => _showSearchBar = !_showSearchBar),
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
                          MaterialPageRoute(
                            builder: (context) => const SignIn(),
                          ),
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

            // ✅ Scrollable Form
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 24),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "Edit Books",
                          style: TextStyle(
                            color: MyColors.primary,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Image Picker
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.teal.shade50,
                              border: Border.all(color: Colors.teal),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: _selectedImage != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.file(
                                      _selectedImage!,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  )
                                : const Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.image,
                                          color: Colors.teal,
                                          size: 40,
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Tap to upload book image',
                                          style: TextStyle(color: Colors.teal),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                      ),

                      // Title Field
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: titleController,
                          keyboardType: TextInputType.text,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: const TextStyle(color: Colors.teal),
                          decoration: _inputDecoration(
                            'Title',
                            'Enter Book Title',
                            Icons.book,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Title is required";
                            final nameRegex = RegExp(r"^[A-Za-z ]{3,}$");
                            if (!nameRegex.hasMatch(value))
                              return "Enter a valid book title";
                            return null;
                          },
                        ),
                      ),

                      // Author Field
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: authorController,
                          keyboardType: TextInputType.text,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: const TextStyle(color: Colors.teal),
                          decoration: _inputDecoration(
                            'Author',
                            'Enter Author Name',
                            Icons.person,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Author is required";
                            final authorRegex = RegExp(r"^[A-Za-z ]{3,}$");
                            if (!authorRegex.hasMatch(value))
                              return "Enter a valid author name";
                            return null;
                          },
                        ),
                      ),

                      // Description Field
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: descriptionController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: const TextStyle(color: Colors.teal),
                          decoration: _inputDecoration(
                            'Description',
                            'Enter Book Description',
                            Icons.description,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Description is required";
                            if (value.length < 10)
                              return "Description must be at least 10 characters";
                            return null;
                          },
                        ),
                      ),

                      // Category Dropdown
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              hint: const Text(
                                "Select Category",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.teal,
                                ),
                              ),
                              buttonStyleData: ButtonStyleData(
                                height: 50,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  border: Border.all(color: Colors.teal),
                                ),
                                elevation: 3,
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.teal,
                                ),
                                iconSize: 28,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: 250,
                                width: MediaQuery.of(context).size.width - 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                ),
                                offset: const Offset(0, -4),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(40),
                                  thickness: WidgetStateProperty.all(5),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                              items: categories.map((String category) {
                                return DropdownMenuItem(
                                  value: category,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        category,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.teal,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      if (selectedValue == category)
                                        const Icon(
                                          Icons.check_circle,
                                          color: Colors.teal,
                                          size: 18,
                                        ),
                                    ],
                                  ),
                                );
                              }).toList(),
                              value: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),

                      // Price Field
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: priceController,
                          keyboardType: TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: const TextStyle(color: Colors.teal),
                          decoration: _inputDecoration(
                            'Price',
                            'Enter Book Price',
                            Icons.currency_exchange_sharp,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Price is required";
                            final priceRegex = RegExp(r'^\d+(\.\d{1,2})?$');
                            if (!priceRegex.hasMatch(value))
                              return "Enter a valid price (e.g. 100 or 99.99)";
                            return null;
                          },
                        ),
                      ),

                      // Submit Button
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: MyElevatedButtonTheme
                                .lightElevatedButtonTheme
                                .style,
                            onPressed: () {
                              if (formKey.currentState!.validate() &&
                                  _selectedImage != null) {
                                // Submit logic
                              }
                            },
                            child: const Text("Edit Book"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

InputDecoration _inputDecoration(String label, String hint, IconData icon) {
  return InputDecoration(
    labelText: label,
    hintText: hint,
    labelStyle: const TextStyle(color: Colors.teal),
    hintStyle: const TextStyle(color: Colors.teal),
    prefixIcon: Icon(icon, color: Colors.teal),
    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.teal, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.teal, width: 2),
    ),
  );
}
