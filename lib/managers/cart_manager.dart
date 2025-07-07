import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/cart_item.dart';

class CartManager {
  static final _firestore = FirebaseFirestore.instance;
  static final _auth = FirebaseAuth.instance;

  static CollectionReference<Map<String, dynamic>> _userCartRef() {
    final uid = _auth.currentUser?.uid;
    return _firestore.collection('users').doc(uid).collection('cartItems');
  }

  static Future<void> addToCart(CartItem item) async {
    final ref = _userCartRef().doc(item.bookId);

    final doc = await ref.get();
    if (doc.exists) {
      // update quantity
      await ref.update({'quantity': FieldValue.increment(1)});
    } else {
      await ref.set(item.toMap());
    }
  }

  static Future<void> removeFromCart(String bookId) async {
    await _userCartRef().doc(bookId).delete();
  }

  static Future<void> updateQuantity(String bookId, int quantity) async {
    if (quantity <= 0) {
      await removeFromCart(bookId);
    } else {
      await _userCartRef().doc(bookId).update({'quantity': quantity});
    }
  }

  static Stream<List<CartItem>> getCartStream() {
    return _userCartRef().snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => CartItem.fromMap(doc.data())).toList();
    });
  }
}
