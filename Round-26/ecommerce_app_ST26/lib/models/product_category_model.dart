// To parse this JSON data, do
//
//     final categoryProduct = categoryProductFromJson(jsonString);

import 'dart:convert';

CategoryProduct categoryProductFromJson(String str) => CategoryProduct.fromJson(json.decode(str));

String categoryProductToJson(CategoryProduct data) => json.encode(data.toJson());

class CategoryProduct {
  final int id;
  final String price;
  final String oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  CategoryProduct({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory CategoryProduct.fromJson(Map<String, dynamic> json) => CategoryProduct(
    id: json["id"],
    price: json["price"].toString(),
    oldPrice: json["old_price"].toString(),
    discount: json["discount"],
    image: json["image"],
    name: json["name"],
    description: json["description"],
    images: List<String>.from(json["images"].map((x) => x)),
    inFavorites: json["in_favorites"],
    inCart: json["in_cart"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "old_price": oldPrice,
    "discount": discount,
    "image": image,
    "name": name,
    "description": description,
    "images": List<dynamic>.from(images.map((x) => x)),
    "in_favorites": inFavorites,
    "in_cart": inCart,
  };
}
