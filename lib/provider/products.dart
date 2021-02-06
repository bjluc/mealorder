import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final double price;
  final List<String> imageUrl;

  Product({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
  });
}

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection("Products");
  Future fetchData(String collection) async {
    QuerySnapshot querySnapshot = await _productsRef.get();
    return querySnapshot.docs;
  }
}
