import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/cart_item.dart';

class WishlistManager {
  static final _firestore = FirebaseFirestore.instance;
  static final _auth = FirebaseAuth.instance;

  static CollectionReference<Map<String, dynamic>> _userWishlistRef() {
    final uid = _auth.currentUser?.uid;
    if (uid == null) throw Exception('User not logged in');
    return _firestore.collection('users').doc(uid).collection('wishlistItems');
  }

  static Future<void> addToWishlist(CartItem item) async {
    final ref = _userWishlistRef().doc(item.bookId);
    if (!(await ref.get()).exists) {
      await ref.set(item.toMap());
      print("💖 Wishlist added: ${item.title}");
    }
  }

  static Future<void> removeFromWishlist(CartItem item) async {
    final ref = _userWishlistRef().doc(item.bookId);
    await ref.delete();
    print("🗑 Removed from wishlist: ${item.title}");
  }

  static Stream<List<CartItem>> getWishlistStream() {
    return _userWishlistRef().snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => CartItem.fromMap(doc.data())).toList();
    });
  }

  static Future<bool> isInWishlist(String bookId) async {
    final doc = await _userWishlistRef().doc(bookId).get();
    return doc.exists;
  }
}

