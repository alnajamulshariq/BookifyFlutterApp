class CartItem {
  final String title;
  final String author;
  final String imageUrl;
  final double price;
  int quantity;

  CartItem({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
  });
}
