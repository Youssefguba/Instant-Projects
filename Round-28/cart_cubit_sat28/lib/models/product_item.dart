import 'package:flutter/material.dart';

class ProductItem {
  final int id;
  final Color color;
  final String name;
  final double price;

  bool isAdded = false;


  ProductItem({
    required this.id,
    required this.color,
    required this.name,
    required this.price,
  });


}

