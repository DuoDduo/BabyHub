import 'package:babyhub/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:babyhub/features/shop/controllers/category_controller.dart';
import 'package:babyhub/features/shop/screens/sub_category/sub_category.dart';
import 'package:babyhub/utils/popups/category_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BHomeCategories extends StatelessWidget {
  const BHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) {
        return const BCategoryShimmer();
      }
      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            "No Data Found",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return BVerticalImageText(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() => const SubCategoriesScreen()),
            );
          },
        ),
      );
    });
  }
}
