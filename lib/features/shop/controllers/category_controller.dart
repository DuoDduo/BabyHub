import 'package:babyhub/data/repositories/categories/category_repository.dart';
import 'package:babyhub/features/shop/models/category_model.dart';
import 'package:babyhub/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());

  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  ///Load Category data
  Future<void> fetchCategories() async {
    try {
      /// Show loader while loading categories
      isLoading.value = true;

      /// Fetch categories
      final categories = await _categoryRepository.getAllCategories();

      /// Update categories
      allCategories.assignAll(categories);

      /// Filter featured categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      BLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
