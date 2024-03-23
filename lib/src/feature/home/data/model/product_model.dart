import 'package:task/src/feature/home/domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    super.category,
    super.description,
    super.id,
    super.image,
    super.title,
    super.price,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      category: json["category"],
      description: json["description"],
      id: json["id"],
      image: json["image"],
      title: json["title"],
      price: double.parse(json["price"].toString()),
    );
  }
}
