import 'package:babyhub/common/widgets/appbar/appbar.dart';
import 'package:babyhub/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:babyhub/features/shop/screens/checkout/checkout.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BAppBar(
        title: Text(" Cart", style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(BabyHubSizes.defaultSpace),
        child: BCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(BabyHubSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: const Text(" Checkout ₦5,200"),
        ),
      ),
    );
  }
}
