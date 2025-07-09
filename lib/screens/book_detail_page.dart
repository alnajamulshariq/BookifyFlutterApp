import 'package:bookify/models/cart_item.dart';
import 'package:bookify/managers/cart_manager.dart';
import 'package:bookify/screens/cart.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/app_navbar.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookDetailPage extends StatefulWidget {
  final String bookId;
  const BookDetailPage({super.key, required this.bookId});

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  final TextEditingController searchController = TextEditingController();
  final auth = FirebaseAuth.instance;
  DocumentSnapshot? bookData;
  double? selectedRating;
  final reviewController = TextEditingController();
  double averageRating = 0.0;
  List<Map<String, dynamic>> reviews = [];

  @override
  void initState() {
    super.initState();
    fetchBookData();
    fetchAverageRating();
    fetchReviews();
  }

  Future<void> fetchBookData() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('books')
        .doc(widget.bookId)
        .get();
    if (snapshot.exists) {
      setState(() => bookData = snapshot);
    }
  }

  Future<void> fetchAverageRating() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('book_reviews')
        .where('bookId', isEqualTo: widget.bookId)
        .get();

    if (snapshot.docs.isNotEmpty) {
      final total = snapshot.docs.fold<double>(
        0.0,
        (sum, doc) => sum + (doc['rating'] as num).toDouble(),
      );
      setState(() {
        averageRating = total / snapshot.docs.length;
      });
    }
  }

  Future<void> fetchReviews() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('book_reviews')
        .where('bookId', isEqualTo: widget.bookId)
        .orderBy('created_at', descending: true)
        .get();

    setState(() {
      reviews = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

  Future<void> submitReview() async {
  final user = auth.currentUser;

  if (selectedRating != null &&
      reviewController.text.isNotEmpty &&
      user != null) {
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        final userData = userDoc.data() as Map<String, dynamic>;
        final fullName = userData['name']?.toString().trim() ?? '';
        final profileImage =
            userData['profile_image_url']?.toString().trim() ?? '';

        final review = {
          'bookId': widget.bookId,
          'userId': user.uid,
          'userName': fullName.isNotEmpty && !fullName.contains('@')
              ? fullName
              : (user.email ?? 'Anonymous'),
          'userImage': profileImage,
          'rating': selectedRating,
          'review': reviewController.text,
          'created_at': FieldValue.serverTimestamp(),
        };

        await FirebaseFirestore.instance
            .collection('book_reviews')
            .add(review);

        // 🔁 Fetch all reviews for that book again
        final snapshot = await FirebaseFirestore.instance
            .collection('book_reviews')
            .where('bookId', isEqualTo: widget.bookId)
            .get();

        if (snapshot.docs.isNotEmpty) {
          final total = snapshot.docs.fold<double>(
              0.0, (sum, doc) => sum + (doc['rating'] as num).toDouble());
          final avgRating = total / snapshot.docs.length;

          // 🔄 Update average in books collection
          await FirebaseFirestore.instance
              .collection('books')
              .doc(widget.bookId)
              .update({'averageRating': avgRating});
        }

        reviewController.clear();
        selectedRating = null;

        await fetchAverageRating();
        await fetchReviews();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Review submitted successfully")),
        );
      } else {
        throw Exception('User document not found.');
      }
    } catch (e) {
      print("🔥 Error saving review: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to submit review.")),
      );
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please enter rating and review")),
    );
  }
}


  Widget buildRatingStars({
    required double value,
    void Function(double)? onTap,
  }) {
    return Row(
      children: List.generate(5, (index) {
        final starValue = index + 1.0;
        return GestureDetector(
          onTap: onTap != null ? () => onTap(starValue) : null,
          child: Icon(
            value >= starValue ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (bookData == null) {
      return const Scaffold(
        backgroundColor: Color(0xFFeeeeee),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final book = bookData!.data() as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: const Color(0xFFeeeeee),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            CustomNavBar(searchController: searchController),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: book['cover_image_url'] != null
                            ? Image.network(
                                book['cover_image_url'],
                                width: 200,
                                height: 280,
                                fit: BoxFit.cover,
                              )
                            : const Image(
                                image: AssetImage(
                                  'assets/images/default_cover.jpg',
                                ),
                                width: 200,
                                height: 280,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      book['title'] ?? 'No Title',
                      style: MyTextTheme.lightTextTheme.headlineMedium,
                    ),
                    const SizedBox(height: 6),
                    if (book.containsKey('author'))
                      Text(
                        "By ${book['author']}",
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    const SizedBox(height: 8),
                    Text(
                      book['genre'] ?? 'Unknown',
                      style: const TextStyle(color: Colors.teal, fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          "\$${book['price'] ?? 0}",
                          style: const TextStyle(
                            color: MyColors.primary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        buildRatingStars(value: averageRating),
                        const SizedBox(width: 4),
                        Text(
                          averageRating.toStringAsFixed(1),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Description",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: MyColors.primary,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_shopping_cart),
                          color: MyColors.primary,
                          onPressed: () {
                            final item = CartItem(
                              bookId: widget.bookId,
                              title: book['title'] ?? 'No Title',
                              author: book['author'] ?? 'Unknown',
                              imageUrl: book['cover_image_url'] ?? '',
                              price: (book['price'] is int)
                                  ? (book['price'] as int).toDouble()
                                  : (book['price'] ?? 0.0),
                            );
                            CartManager.addToCart(item);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${item.title} added to cart'),
                              ),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CartScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      book['description'] ?? "No description available.",
                      style: const TextStyle(fontSize: 15, color: Colors.teal),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "Rate & Review this Book",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: MyColors.primary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    buildRatingStars(
                      value: selectedRating ?? 0.0,
                      onTap: (val) => setState(() => selectedRating = val),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: reviewController,
                      maxLines: 3,
                      style: const TextStyle(color: Colors.teal),
                      decoration: InputDecoration(
                        hintText: "Write your review here...",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.primary,
                        ),
                        onPressed: submitReview,
                        child: const Text("Submit Review"),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "User Reviews",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: MyColors.primary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...reviews.map(
                      (review) => Card(
                        color: Colors.white,
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey.shade200,
                            backgroundImage:
                                (review['userImage'] ?? '')
                                    .toString()
                                    .isNotEmpty
                                ? NetworkImage(review['userImage'])
                                : null,
                            child:
                                (review['userImage'] ?? '').toString().isEmpty
                                ? const Icon(Icons.person, color: Colors.grey)
                                : null,
                          ),
                          title: Text(
                            review['userName'] ?? 'Anonymous',
                            style: const TextStyle(color: MyColors.primary),
                          ),
                          subtitle: Text(
                            review['review'] ?? '',
                            style: const TextStyle(color: Colors.teal),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              Text(
                                '${review['rating'] ?? ''}',
                                style: const TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
