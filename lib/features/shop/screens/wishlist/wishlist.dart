import 'package:babyhub/common/widgets/appbar/appbar.dart';
import 'package:babyhub/common/widgets/icons/b_circular_icon.dart';
import 'package:babyhub/common/widgets/layouts/grid_layout.dart';
import 'package:babyhub/common/widgets/product_cards/product_card_vertical.dart';
import 'package:babyhub/features/shop/screens/home/home.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BAppBar(
        title:
            Text("Wishlist", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          BCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(BabyHubSizes.defaultSpace),
            child: Column(
              children: [
                BGridLayout(
                    itemCount: 6,
                    itemBuilder: (_, index) => BProductCardVertical())
              ],
            )),
      ),
    );
  }
}
