import 'package:babyhub/features/shop/models/brand_model.dart';
import 'package:babyhub/features/shop/models/product_attribute_model.dart';
import 'package:babyhub/features/shop/models/product_variation_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String id;
  String? sku;
  String title;
  int stock;
  double price;
  List<String>? images;
  String thumbnail;
  double salePrice;
  bool? isFeatured;
  String? categoryId;
  String productType;
  BrandModel? brand;
  String? description;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.images,
    this.salePrice = 0.0,
    this.isFeatured,
    this.categoryId,
    this.brand,
    this.description,
    this.productAttributes,
    this.productVariations,
  });

  static ProductModel empty() => ProductModel(
        id: ' ',
        title: '',
        stock: 0,
        price: 0,
        thumbnail: ' ',
        productType: ' ',
      );

  toJson() {
    return {
      'Sku': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Thumbnail': thumbnail,
      'ProductType': productType,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'Images': images ?? [],
      'CategoryId': categoryId,
      'Brand': brand?.toJson(), // Add null check for brand
      'Description': description,
      'ProductAttributes': productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      'ProductVariations': productVariations != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    if (document.data() == null) return ProductModel.empty();
    return ProductModel(
        id: document.id,
        title: data['Title'],
        stock: data['Stock'] ?? 0,
        price: double.parse((data['Price'] ?? 0.0).toString()),
        thumbnail: data['Thumbnail'] ?? '',
        productType: data['ProductType'] ?? '',
        sku: data['Sku'],
        images: data['Images'] != null ? List<String>.from(data['Images']) : [],
        salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
        isFeatured: data['IsFeatured'] ?? false,
        categoryId: data['CategoryId'] ?? '',
        brand: BrandModel.fromJson(data['Brand']),
        description: data['Description'] ?? '',
        productAttributes: (data['ProductAttributes'] as List<dynamic>)
            .map((e) => ProductAttributeModel.fromJson(e))
            .toList(),
        productVariations: (data['ProductVariations'] as List<dynamic>)
            .map((e) => ProductVariationModel.fromJson(e))
            .toList());
  }

  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    final data =
        document.data() as Map<String, dynamic>?; // Cast data to nullable Map
    if (data == null) return ProductModel.empty(); // Check if data is null
    return ProductModel(
      id: document.id,
      title: data['Title'] as String? ??
          '', // Use null check operator to handle potential null values
      stock: data['Stock'] as int? ?? 0,
      price: (data['Price'] as num? ?? 0.0)
          .toDouble(), // Ensure conversion to double
      thumbnail: data['Thumbnail'] as String? ?? '',
      productType: data['ProductType'] as String? ?? '',
      sku: data['Sku'] as String? ?? '',
      images: (data['Images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      salePrice: (data['SalePrice'] as num? ?? 0.0)
          .toDouble(), // Ensure conversion to double
      isFeatured: data['IsFeatured'] as bool? ?? false,
      categoryId: data['CategoryId'] as String? ?? '',
      brand: BrandModel.fromJson(data['Brand'] as Map<String, dynamic>? ??
          {}), // Ensure data['brand'] is not null
      description: data['Description'] as String? ?? '',
      productAttributes: (data['ProductAttributes'] as List<dynamic>? ?? [])
          .map((e) => ProductAttributeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>? ?? [])
          .map((e) => ProductVariationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
