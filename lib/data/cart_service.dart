import '../models/cart.dart';

class CartService {
  static List<Cart> cartItems = [];

  static CartService _singleton = CartService._internal();

  factory CartService() {
    return _singleton;
  }

  CartService._internal();

  static void addToCart(Cart item) {
    cartItems.add(item);
  }

  static List<Cart> getCart() {
    return cartItems;
  }

  static void removeFromCart(Cart item) {
    cartItems.remove(item);
  }
}
