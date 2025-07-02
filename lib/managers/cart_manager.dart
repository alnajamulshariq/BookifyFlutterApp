import '../models/cart_item.dart';

class CartManager {
  static final List<CartItem> _cartItems = [];

  static List<CartItem> get cartItems => _cartItems;

  static void addToCart(CartItem item) {
    final existing = _cartItems.firstWhere(
      (e) => e.title == item.title,
      orElse: () => CartItem(title: '', author: '', imageUrl: '', price: 0),
    );

    if (existing.title != '') {
      existing.quantity++;
    } else {
      _cartItems.add(item);
    }
  }

  static void removeFromCart(CartItem item) {
    _cartItems.remove(item);
  }
}
