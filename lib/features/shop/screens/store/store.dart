import 'package:babyhub/common/widgets/appbar/appbar.dart';
import 'package:babyhub/common/widgets/appbar/tabbar.dart';
import 'package:babyhub/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:babyhub/common/widgets/layouts/grid_layout.dart';
import 'package:babyhub/common/widgets/product_cards/b_brand_card.dart';
import 'package:babyhub/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:babyhub/common/widgets/texts/section_heading.dart';
import 'package:babyhub/features/shop/controllers/brand_controller.dart';
import 'package:babyhub/features/shop/controllers/category_controller.dart';
import 'package:babyhub/features/shop/screens/brand/all_brands.dart';
import 'package:babyhub/features/shop/screens/store/widgets/category_tab.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:babyhub/utils/popups/brands_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController()); // Fetch BrandController
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: BAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            BCartCounterIcon(
                onPressed: () {},
                iconColor: BHelperFunctions.isDarkMode(context)
                    ? BabyHubColors.white
                    : BabyHubColors.dark),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: BHelperFunctions.isDarkMode(context)
                    ? BabyHubColors.black
                    : BabyHubColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(BabyHubSizes.defaultSpace),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      const SizedBox(height: BabyHubSizes.spaceBtwItems),
                      const BSearchContainer(
                        text: "Search in Store",
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: BabyHubSizes.spaceBtwSections),
                      BSectionHeading(
                        title: "Featured Brands",
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                      ),
                      const SizedBox(height: BabyHubSizes.spaceBtwItems / 1.5),
                      Obx(() {
                        if (brandController.isLoading.value) {
                          return const BBrandsShimmer(); // Display loading shimmer
                        } else if (brandController.featuredBrands.isEmpty) {
                          return Center(
                            child: Text(
                              "No Data Found",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.apply(color: Colors.white),
                            ),
                          );
                        } else {
                          // Display featured brands
                          return BGridLayout(
                            itemCount: brandController.featuredBrands.length,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              final brand =
                                  brandController.featuredBrands[index];
                              return BBrandCard(
                                showBorder: true,
                                brand: brand,
                              );
                            },
                          );
                        }
                      }),
                    ],
                  ),
                ),
                bottom: BTabBar(
                  tabs: categories
                      .map((category) => Tab(child: Text(category.name)))
                      .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: categories
                .map((category) => BCategoryTab(category: category))
                .toList(),
          ),
        ),
      ),
    );
  }
}
