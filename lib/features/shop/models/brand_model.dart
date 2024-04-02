import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });

  static BrandModel empty() => BrandModel(id: '', name: '', image: '');

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductsCount': productsCount,
      'IsFeatured': isFeatured,
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> data) {
    return BrandModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      productsCount: data['ProductsCount'] is int
          ? data['ProductsCount']
          : int.tryParse(data['ProductsCount'].toString()) ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
    );
  }

  factory BrandModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    if (data != null) {
      return BrandModel(
        id: snapshot.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        productsCount: data['ProductsCount'] is int
            ? data['ProductsCount']
            : int.tryParse(data['ProductsCount'].toString()) ?? 0,
        isFeatured: data['IsFeatured'] ?? false,
      );
    } else {
      return BrandModel.empty(); // Return an empty BrandModel if data is null
    }
  }
}
