import 'package:babyhub/data/repositories/brands/brands_repository.dart';
import 'package:babyhub/features/shop/models/brand_model.dart';
import 'package:babyhub/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();
  RxBool isLoading = true.obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  Future<void> getFeaturedBrands() async {
    try {
      isLoading.value = true;
      final brands = await brandRepository.getAllBrands();
      allBrands.assignAll(brands);
      featuredBrands.assignAll(
          allBrands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      BLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
