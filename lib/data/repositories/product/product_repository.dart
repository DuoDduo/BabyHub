import 'package:babyhub/features/shop/models/product_model.dart';
import 'package:babyhub/utils/exceptions/firebase_exceptions.dart';
import 'package:babyhub/utils/exceptions/platform_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      if (kDebugMode) {
        print("Executing getFeaturedProducts method...");
      }
      final querySnapshot = await _db
          .collection("Products")
          .where("IsFeatured", isEqualTo: true)
          .limit(4)
          .get();

      if (kDebugMode) {
        print("Firestore query executed successfully.");
      }

      final List<ProductModel> products = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();

      if (products.isNotEmpty) {
        if (kDebugMode) {
          print(
              "Products fetched successfully: ${products.length} products found.");
        }
      } else {
        if (kDebugMode) {
          print("No featured products found.");
        }
      }

      return products;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Firebase Exception occurred: ${e.code}");
      }
      throw BFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Platform Exception occurred: ${e.code}");
      }
      throw BPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) {
        print("Unexpected error occurred: $e");
      }
      throw "Something went wrong, please try again";
    }
  }
}
