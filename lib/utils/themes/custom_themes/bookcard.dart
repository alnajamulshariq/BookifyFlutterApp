import 'package:bookify/managers/wishlist_manager.dart';
import 'package:bookify/managers/cart_manager.dart';
import 'package:bookify/models/cart_item.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookCard extends StatefulWidget {
  final String bookId;
  final String title;
  final String author;
  final String imagePath;
  final String category;
  final double price;
  final double? rating;

  const BookCard({
    super.key,
    required this.bookId,
    required this.title,
    required this.author,
    required this.imagePath,
    required this.category,
    required this.price,
    this.rating,
  });

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  bool isFavorited = false;
  double averageRating = 0.0;

  @override
  void initState() {
    super.initState();
    averageRating = widget.rating ?? 0.0; // ✅ Fallback to 0.0 if null
    _loadWishlistStatus();
    _fetchAverageRating(); // ✅ Override from Firestore if available
  }

  Future<void> _loadWishlistStatus() async {
    final exists = await WishlistManager.isInWishlist(widget.bookId);
    setState(() => isFavorited = exists);
  }

  Future<void> _fetchAverageRating() async {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 📕 Image + Favorite Button
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.imagePath,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, _, __) =>
                      const Icon(Icons.broken_image),
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: GestureDetector(
                  onTap: () async {
                    final item = CartItem(
                      bookId: widget.bookId,
                      title: widget.title,
                      author: widget.author,
                      imageUrl: widget.imagePath,
                      price: widget.price,
                    );

                    setState(() => isFavorited = !isFavorited);

                    if (isFavorited) {
                      await WishlistManager.addToWishlist(item);
                    } else {
                      await WishlistManager.removeFromWishlist(item);
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          isFavorited
                              ? '${widget.title} added to wishlist'
                              : '${widget.title} removed from wishlist',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isFavorited ? Icons.favorite : Icons.favorite_border,
                      size: 18,
                      color: isFavorited ? Colors.red : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // 📝 Title
          Text(
            widget.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.deepOrange,
            ),
          ),

          // 🏷️ Category
          Text(
            widget.category,
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),

          const SizedBox(height: 6),

          // 💵 Price | ⭐ Rating | 🛒 Cart
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${widget.price.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star, size: 14, color: Colors.amber),
                  const SizedBox(width: 2),
                  Text(
                    averageRating.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: () {
                      CartManager.addToCart(
                        CartItem(
                          bookId: widget.bookId,
                          title: widget.title,
                          author: widget.author,
                          imageUrl: widget.imagePath,
                          price: widget.price,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${widget.title} added to cart'),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.add_shopping_cart,
                      size: 18,
                      color: MyColors.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
