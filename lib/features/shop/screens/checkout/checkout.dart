import 'package:babyhub/common/styles/rounded_container.dart';
import 'package:babyhub/common/success_screen/success_screen.dart';
import 'package:babyhub/common/widgets/appbar/appbar.dart';
import 'package:babyhub/common/widgets/products/cart/coupon_widget.dart';
import 'package:babyhub/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:babyhub/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:babyhub/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:babyhub/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:babyhub/navigation_menu.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: BAppBar(
          title: Text(" Order Review ",
              style: Theme.of(context).textTheme.headlineSmall),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(BabyHubSizes.defaultSpace),
            child: Column(
              children: [
                const BCartItems(
                  showAddRemoveButton: false,
                ),
                const SizedBox(
                  height: BabyHubSizes.spaceBtwSections,
                ),
                const BCouponCode(),
                const SizedBox(
                  height: BabyHubSizes.spaceBtwSections,
                ),
                BRoundedContainer(
                  showBorder: true,
                  padding: const EdgeInsets.all(BabyHubSizes.md),
                  backgroundColor:
                      dark ? BabyHubColors.black : BabyHubColors.white,
                  child: const Column(
                    children: [
                      BBillingAmountSection(),
                      SizedBox(height: BabyHubSizes.spaceBtwItems),
                      Divider(),
                      SizedBox(height: BabyHubSizes.spaceBtwItems),
                      BBillingPaymentSection(),
                      SizedBox(height: BabyHubSizes.spaceBtwItems),
                      BBillingAddressSection()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(BabyHubSizes.defaultSpace),
          child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                  image: BabyHubImages.verifyIllustration,
                  title: 'Payment Successful!',
                  subTitle: ' Your item will be shipped soon',
                  onPressed: () => Get.offAll(() => const NavigationMenu()),
                )),
            child: const Text(" Checkout ₦5,200"),
          ),
        ));
  }
}
