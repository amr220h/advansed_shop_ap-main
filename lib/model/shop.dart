import 'package:flutter/material.dart';
import 'package:instgram_app/model/product.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
      name: 'glass',
      price: 120,
      description: 'items descraption',
      imagepath: 'assets/img/Reading Glasses Large Frame Metalless Screwless Spec Women Men.jpg'
    ),
    Product(
      name: 'prodect 1',
      price: 99.99,
      description: 'items descraption',
        imagepath: 'assets/img/In-store restock 🫂 250+ new items available in-store every Friday at 12pm Swipe to see a few of our favorites from this weeks restock 114 E Jefferson St.jpg'
    ),
    Product(
      name: 'prodect 1',
      price: 99.99,
      description: 'items descraption',
        imagepath: 'assets/img/Reading Glasses Large Frame Metalless Screwless Spec Women Men.jpg'
    ),
    Product(
      name: 'prodect 1',
      price: 99.99,
      description: 'items descraption',
      imagepath: 'assets/img/In-store restock 🫂 250+ new items available in-store every Friday at 12pm Swipe to see a few of our favorites from this weeks restock 114 E Jefferson St.jpg'
    ),
  ];
  List<Product> _cart = [];
  List<Product> get shop => _shop;
  List<Product> get cart => _cart;
  void addToCart(Product item) {
    _cart.add(item);
    void RemoveFromCart(Product item) {
      _cart.remove(item);
      notifyListeners();
    }
  }

  void removeItemFromCart(Product product) {}

  void removeFromCart(Product product) {}
}
