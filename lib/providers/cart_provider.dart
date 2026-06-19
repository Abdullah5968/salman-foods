import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../models/cart_item.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);

  int get totalPrice => _items.fold(0, (sum, item) => sum + item.totalPrice);

  void addItem(MenuItem menuItem) {
    final index = _items.indexWhere((i) => i.menuItem.id == menuItem.id);
    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(menuItem: menuItem));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    final index = _items.indexWhere((i) => i.menuItem.id == id);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  int getQuantity(String id) {
    final index = _items.indexWhere((i) => i.menuItem.id == id);
    return index >= 0 ? _items[index].quantity : 0;
  }
}
