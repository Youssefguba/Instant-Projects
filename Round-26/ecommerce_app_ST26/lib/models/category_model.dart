class CategoryModel {
  String image;
  String title;
  String? color;

  CategoryModel({
    required this.title,
    required this.image,
    this.color,
  });
}

