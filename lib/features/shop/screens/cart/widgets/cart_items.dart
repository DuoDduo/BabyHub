import 'package:babyhub/common/widgets/products/cart/add_remove_button.dart';
import 'package:babyhub/common/widgets/products/cart/cart_item.dart';
import 'package:babyhub/common/widgets/texts/product_price_text.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:flutter/material.dart';

class BCartItems extends StatelessWidget {
  const BCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) =>
          const SizedBox(height: BabyHubSizes.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [
          const BCartItem(),
          if (showAddRemoveButton)
            const SizedBox(height: BabyHubSizes.spaceBtwItems),
          if (showAddRemoveButton)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                    ),
                    BProductQuantityWithAddRemoveButton(),
                  ],
                ),
                BProductPriceText(price: " 1,200")
              ],
            )
        ],
      ),
    );
  }
}
