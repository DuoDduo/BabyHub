import 'package:babyhub/data/repositories/product/product_repository.dart';
import 'package:babyhub/features/shop/models/product_model.dart';
import 'package:babyhub/utils/constant/enums.dart';
import 'package:babyhub/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  // Initialize ProductRepository without Get.put()
  final ProductRepository productRepository = ProductRepository();
  final isLoading = false.obs;
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  Future<void> fetchFeaturedProducts() async {
    try {
      isLoading.value = true;
      final products = await productRepository.getFeaturedProducts();
      featuredProducts.assignAll(products);
    } catch (e) {
      BLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String getProductPrice(ProductModel product) {
    if (product.productType == ProductType.single.name.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      double smallestPrice = double.infinity;
      double largestPrice = 0.0;

      for (var variation in product.productVariations ?? []) {
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        return "$smallestPrice - \$$largestPrice";
      }
    }
  }

  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0 || originalPrice <= 0) {
      return null;
    }

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? "In Stock" : "Out of Stock";
  }
}
