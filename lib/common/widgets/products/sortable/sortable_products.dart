import 'package:babyhub/common/widgets/layouts/grid_layout.dart';
import 'package:babyhub/common/widgets/product_cards/product_card_vertical.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BSortableProducts extends StatelessWidget {
  const BSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            items: [
              'Name',
              'Higher Price',
              'Lower Price',
              'Sale',
              'Newest',
              ' Popularity'
            ]
                .map((option) =>
                    DropdownMenuItem(value: option, child: Text(option)))
                .toList(),
            onChanged: (value) {}),
        const SizedBox(
          height: BabyHubSizes.spaceBtwSections,
        ),
        BGridLayout(
            itemCount: 8, itemBuilder: (_, index) => BProductCardVertical())
      ],
    );
  }
}
