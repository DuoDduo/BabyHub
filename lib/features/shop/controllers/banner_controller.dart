import 'package:babyhub/data/repositories/banners/banner_repository.dart';
import 'package:babyhub/features/shop/models/banner_model.dart';
import 'package:babyhub/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;

  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      /// Show loader while loading categories
      isLoading.value = true;

      /// Fetch banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      ///Assign Banners
      this.banners.assignAll(banners);
    } catch (e) {
      BLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
