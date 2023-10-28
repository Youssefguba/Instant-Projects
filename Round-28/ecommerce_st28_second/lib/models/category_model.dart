
class CategoryModel {
  final bool status;
  final dynamic message;
  final CategoryData categoryData;

  CategoryModel({
    required this.status,
    required this.message,
    required this.categoryData,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    status: json["status"],
    message: json["message"],
    categoryData: CategoryData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": categoryData.toJson(),
  };
}

class CategoryData {
  final int currentPage;
  final List<CategoryItemModel> listOfCategories;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final dynamic nextPageUrl;
  final String path;
  final int perPage;
  final dynamic prevPageUrl;
  final int to;
  final int total;

  CategoryData({
    required this.currentPage,
    required this.listOfCategories,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
    currentPage: json["current_page"],
    listOfCategories: List<CategoryItemModel>.from(json["data"].map((x) => CategoryItemModel.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(listOfCategories.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class CategoryItemModel {
  final int id;
  final String name;
  final String image;

  CategoryItemModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryItemModel.fromJson(Map<String, dynamic> json) => CategoryItemModel(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}
