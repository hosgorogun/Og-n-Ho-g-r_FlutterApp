import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final Map<int, Product> _items = {};

  Map<int, Product> get items => {..._items};

  double get totalPrice {
    double total = 0.0;
    _items.forEach((key, product) {
      total += product.price;
    });
    return total;
  }

  void addItem(Product product) {
    _items.putIfAbsent(product.id, () => product);
    notifyListeners();
  }

  void removeItem(int productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}