// class CartItem {
//   final String title;
//   final String author;
//   final String imageUrl;
//   final double price;
//   int quantity;

//   CartItem({
//     required this.title,
//     required this.author,
//     required this.imageUrl,
//     required this.price,
//     this.quantity = 1,
//   });
// }



class CartItem {
  final String bookId;
  final String title;
  final String author;
  final String imageUrl;
  final double price;
  int quantity;

  CartItem({
    required this.bookId,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
  });

  // 🔁 Convert CartItem to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'bookId': bookId,
      'title': title,
      'author': author,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }

  // 🔁 Create CartItem from Firestore Map
  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      bookId: map['bookId'],
      title: map['title'],
      author: map['author'],
      imageUrl: map['imageUrl'],
      price: (map['price'] as num).toDouble(),
      quantity: map['quantity'],
    );
  }
}
