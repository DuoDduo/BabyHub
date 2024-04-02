import 'package:babyhub/features/shop/models/brand_model.dart';
import 'package:babyhub/utils/exceptions/firebase_exceptions.dart';
import 'package:babyhub/utils/exceptions/platform_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection("Brands").get();
      final result =
          snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw BFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw BPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }
}
