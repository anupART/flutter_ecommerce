// import 'dart:js_util';
import 'package:ecommerce/models/product.dart';
import 'package:flutter/cupertino.dart';

class Shop extends ChangeNotifier {
  // Product for sale
  final List<Product> _shop = [
    // Product 1
    Product(
      name: "Watch",
      price: 199,
      description: "The premium watch is an exquisite timepiece crafted with precision and elegance. ",
      imagePath: "assets/watch.jpg",
    ),
    // Product 2
    Product(
      name: "Shoe",
      price: 299,
      description: "Indulge in luxury with our premium shoe collection. ",
      imagePath: "assets/shoes.jpg",
    ),
    // Product 3
    Product(
      name: "Mobile",
      price: 999,
      description: "The premium mobile boasts cutting-edge technology with a stunning AMOLED display. ",
      imagePath: "assets/mobile.jpg",
    ),
    // Product 4
    Product(
      name: "Sunglass",
      price: 199,
      description: "Elevate your style with our exquisite collection of premium sunglasses.",
      imagePath: "assets/sunglass.jpg",
    ),
  ];

  // User cart
  List<Product> _cart = [];

  // User transaction history
  List<TransactionHistory> _transactionHistory = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

  List<TransactionHistory> get transactionHistory => _transactionHistory;

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // Remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }

  // Add transaction to history
  void addTransaction(String productName, double amount, PaymentMethod paymentMethod) {
    _transactionHistory.add(TransactionHistory(
      productName,
      amount,
      DateTime.now(),
      paymentMethod,
    ));
    notifyListeners();
  }
}

class TransactionHistory {
  final String productName;
  final double amount;
  final DateTime date;
  final PaymentMethod paymentMethod;

  TransactionHistory(this.productName, this.amount, this.date, this.paymentMethod);
}

enum PaymentMethod {
  Cash,
  Card,
}
