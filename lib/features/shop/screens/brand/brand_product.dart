import 'package:babyhub/common/widgets/appbar/appbar.dart';
import 'package:babyhub/common/widgets/product_cards/b_brand_card.dart';
import 'package:babyhub/common/widgets/products/sortable/sortable_products.dart';
import 'package:babyhub/features/shop/models/brand_model.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BAppBar(
        title: Text(" Cussons"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BabyHubSizes.defaultSpace),
          child: Column(
            children: [
              BBrandCard(
                showBorder: true,
                brand: BrandModel.empty(),
              ),
              const SizedBox(
                height: BabyHubSizes.spaceBtwSections,
              ),
              const BSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
