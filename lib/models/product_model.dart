class ProductModel {
  final String imageUrl;
  final String name;
  final String mrp;
  final String price;
  bool isFavorite;

  ProductModel({
    required this.imageUrl,
    required this.name,
    required this.mrp,
    required this.price,
    this.isFavorite = false,
  });
}
