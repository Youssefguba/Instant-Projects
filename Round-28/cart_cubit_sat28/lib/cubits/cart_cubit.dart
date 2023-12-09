import 'package:bloc/bloc.dart';
import 'package:cart_cubit_sat28/models/product_item.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<ProductItem> productList = [
    ProductItem(
        id: 1,
        color: const Color(0xFF3498db),
        name: 'Blue Shirt',
        price: 29.99),
    ProductItem(
        id: 2,
        color: const Color(0xFFe74c3c),
        name: 'Red Sneakers',
        price: 49.99),
    ProductItem(
        id: 3,
        color: const Color(0xFF2ecc71),
        name: 'Green Backpack',
        price: 39.99),
    ProductItem(
        id: 4,
        color: const Color(0xFFf39c12),
        name: 'Yellow Sunglasses',
        price: 19.99),
    ProductItem(
        id: 5,
        color: const Color(0xFF8e44ad),
        name: 'Purple Dress',
        price: 59.99),
    ProductItem(
        id: 6,
        color: const Color(0xFFc0392b),
        name: 'Brown Boots',
        price: 69.99),
    ProductItem(
        id: 7,
        color: const Color(0xFF27ae60),
        name: 'Emerald Earrings',
        price: 29.99),
    ProductItem(
        id: 8,
        color: const Color(0xFFd35400),
        name: 'Orange Hat',
        price: 14.99),
    ProductItem(
        id: 9,
        color: const Color(0xFF34495e),
        name: 'Gray Gloves',
        price: 9.99),
    ProductItem(
        id: 10,
        color: const Color(0xFF95a5a6),
        name: 'Silver Watch',
        price: 79.99),
    ProductItem(
        id: 11,
        color: const Color(0xFFe74c3c),
        name: 'Red Hoodie',
        price: 34.99),
    ProductItem(
        id: 12,
        color: const Color(0xFF3498db),
        name: 'Blue Jeans',
        price: 44.99),
    ProductItem(
        id: 13,
        color: const Color(0xFFf39c12),
        name: 'Yellow Umbrella',
        price: 19.99),
    ProductItem(
        id: 14,
        color: const Color(0xFF2ecc71),
        name: 'Green Gloves',
        price: 12.99),
    ProductItem(
        id: 15,
        color: const Color(0xFF8e44ad),
        name: 'Purple Scarf',
        price: 16.99),
    ProductItem(
        id: 16,
        color: const Color(0xFFd35400),
        name: 'Orange Backpack',
        price: 39.99),
    ProductItem(
        id: 17,
        color: const Color(0xFF27ae60),
        name: 'Emerald Necklace',
        price: 29.99),
    ProductItem(
        id: 18,
        color: const Color(0xFFc0392b),
        name: 'Brown Belt',
        price: 14.99),
    ProductItem(
        id: 19,
        color: const Color(0xFF34495e),
        name: 'Gray Sweater',
        price: 49.99),
    ProductItem(
        id: 20,
        color: const Color(0xFF95a5a6),
        name: 'Silver Bracelet',
        price: 24.99),
  ];

  final List<ProductItem> listOfCartItem = [];

  void addToCart(ProductItem item) {
    // if (listOfCartItem.contains(item)) return;

    item.isAdded = true;
    listOfCartItem.add(item);

    if (listOfCartItem.contains(item)) {
      emit(ItemIsAdded(item.name));

      Future.delayed(Duration(seconds: 1), () {
        item.isAdded = false;
        emit(ItemIsAdded(item.name));
      });
    }
  }

  void removeFromCart(ProductItem item) {
    if (listOfCartItem.contains(item)) {
      listOfCartItem.remove(item);
      emit(ItemIsAdded(item.name));
    }
  }
}
