import 'package:babyhub/features/shop/models/category_model.dart';
import 'package:babyhub/utils/exceptions/firebase_exceptions.dart';
import 'package:babyhub/utils/exceptions/platform_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _db.collection('Categories').get();
      List<CategoryModel> categories =
          snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
      return categories;
    } on FirebaseException catch (e) {
      throw BFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw BPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again: $e";
    }
  }
}
