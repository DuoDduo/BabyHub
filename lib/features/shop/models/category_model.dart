import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = ' ',
  });

  ///Empty Helper Function
  static CategoryModel empty() =>
      CategoryModel(id: ' ', name: ' ', image: ' ', isFeatured: false);

  //convert model to Json
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFeatured,
    };
  }

  ///Map Json

  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      //Map Json record to label
      return CategoryModel(
        id: document.id,
        name: data['Name'] ?? ' ',
        image: data['Image'] ?? ' ',
        parentId: data['ParentId'] ?? ' ',
        isFeatured: data['IsFeatured'] ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
