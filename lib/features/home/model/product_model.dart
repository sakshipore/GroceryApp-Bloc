// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) => ProductModel(
        id: map["id"],
        name: map["name"],
        description: map["description"],
        price: map["price"],
        imageUrl: map["imageUrl"],
      );
}
