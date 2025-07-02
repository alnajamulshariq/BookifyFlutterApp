import 'package:bookify/models/cart_item.dart';

class WishlistManager {
  static final List<CartItem> _wishlistItems = [];

  static List<CartItem> get wishlistItems => _wishlistItems;

  static void addToWishlist(CartItem item) {
    if (!_wishlistItems.any((e) => e.title == item.title)) {
      _wishlistItems.add(item);
    }
  }

  static void removeFromWishlist(CartItem item) {
    _wishlistItems.removeWhere((e) => e.title == item.title);
  }

  static bool isInWishlist(String title) {
    return _wishlistItems.any((e) => e.title == title);
  }

  static void clearWishlist() {
    _wishlistItems.clear();
  }
}
