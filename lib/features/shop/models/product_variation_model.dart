class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = ' ',
    this.image = ' ',
    this.description = ' ',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  /// Create Empty func for clean code
  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributeValues: {});

  /// Json Format
  toJson() {
    return {
      'id': id,
      'sku': sku,
      'image': image,
      'description': description,
      'price': price,
      'salePrice': salePrice,
      'stock': stock,
      'attributeValues': attributeValues,
    };
  }

  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      id: data['Id'] ?? '',
      sku: data['sku'] ?? '',
      image: data['image'] ?? '',
      description: data['description'],
      price: double.parse((data['price'] ?? 0.0).toString()),
      salePrice: double.parse((data['salePrice'] ?? 0.0).toString()),
      stock: data['stock'] ?? 0,
      attributeValues: Map<String, String>.from(data['attributeValues'] ?? {}),
    );
  }
}
