import 'package:babyhub/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:babyhub/common/widgets/images/b_rounded_image.dart';
import 'package:babyhub/features/shop/controllers/banner_controller.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/popups/shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BPromoSlider extends StatelessWidget {
  const BPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const BShimmerEffect(width: double.infinity, height: 190);
      }
      if (controller.banners.isEmpty) {
        return const Center(
            child: Text(
          " No Data Found",
        ));
      } else {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index)),
              items: controller.banners
                  .map((banner) => BRoundedImage(
                      imageUrl: banner.imageUrl,
                      isNetworkImage: true,
                      onPressed: () => Get.toNamed(banner.targetScreen)))
                  .toList()
                  .toList(),
            ),
            const SizedBox(
              height: BabyHubSizes.spaceBtwItems,
            ),
            Center(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      BCircularContainer(
                          width: 20,
                          height: 4,
                          margin: const EdgeInsets.only(right: 10),
                          backgroundColor:
                              controller.carouselCurrentIndex.value == i
                                  ? BabyHubColors.primary
                                  : BabyHubColors.grey),
                  ],
                ),
              ),
            )
          ],
        );
      }
    });
  }
}
