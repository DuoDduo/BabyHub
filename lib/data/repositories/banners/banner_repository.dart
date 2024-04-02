import 'package:babyhub/features/shop/models/banner_model.dart';
import 'package:babyhub/utils/exceptions/firebase_exceptions.dart';
import 'package:babyhub/utils/exceptions/platform_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db
          .collection("Banners")
          .where("Active", isEqualTo: true)
          .get();
      return result.docs
          .map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw BFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw BPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }
}
