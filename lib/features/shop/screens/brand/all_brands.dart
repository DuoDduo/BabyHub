import 'package:babyhub/common/widgets/appbar/appbar.dart';
import 'package:babyhub/common/widgets/layouts/grid_layout.dart';
import 'package:babyhub/common/widgets/product_cards/b_brand_card.dart';
import 'package:babyhub/common/widgets/texts/section_heading.dart';
import 'package:babyhub/features/shop/controllers/brand_controller.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/popups/brands_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const BAppBar(
        title: Text(" Brand"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BabyHubSizes.defaultSpace),
          child: Column(
            children: [
              const BSectionHeading(
                title: " Brands",
                showActionButton: false,
              ),
              const SizedBox(
                height: BabyHubSizes.spaceBtwItems,
              ),
              Obx(
                () {
                  if (brandController.isLoading.value) {
                    return const BBrandsShimmer();
                  }
                  if (brandController.allBrands.isEmpty) {
                    return Center(
                        child: Text(" No Data Found",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(color: Colors.white)));
                  }
                  return BGridLayout(
                      itemCount: brandController.allBrands.length,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        final brand = brandController.allBrands[index];
                        return BBrandCard(
                          showBorder: true,
                          brand: brand,
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
