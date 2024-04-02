import 'package:babyhub/common/widgets/appbar/appbar.dart';
import 'package:babyhub/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:babyhub/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:babyhub/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:babyhub/common/widgets/texts/section_heading.dart';
import 'package:babyhub/features/personalization/screens/address/address.dart';
import 'package:babyhub/features/personalization/screens/profile/profile.dart';
import 'package:babyhub/features/shop/screens/order/widgets/order.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header
            BPrimaryHeaderContainer(
                child: Column(
              children: [
                BAppBar(
                  title: Text(
                    " Account",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: BabyHubColors.white),
                  ),
                ),
                const SizedBox(
                  height: BabyHubSizes.spaceBtwSections,
                ),

                ///User Profile Card
                BUserProfileTitle(
                    onPressed: () => Get.to(() => const ProfileScreen())),
                const SizedBox(
                  height: BabyHubSizes.spaceBtwSections,
                ),
              ],
            )),

            ///Body
            Padding(
              padding: const EdgeInsets.all(BabyHubSizes.defaultSpace),
              child: Column(
                children: [
                  const BSectionHeading(
                    title: " Account Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: BabyHubSizes.spaceBtwItems,
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subtitle: 'Set Shipping Delivery Address',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: 'Add, remove products and save to checkout',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subtitle: 'In Progress and Completed Orders',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subtitle: 'Withdraw balance to registered bank account',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subtitle: ' List of all the discounted coupons',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notification',
                    subtitle: 'Set any kind of notification message',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subtitle: 'Manage data usage and connected accounts',
                    onTap: () {},
                  ),

                  ///App Settings
                  const SizedBox(
                    height: BabyHubSizes.spaceBtwSections,
                  ),
                  const BSectionHeading(
                    title: " App Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: BabyHubSizes.spaceBtwItems,
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: " GeoLocation",
                    subtitle: " Set recommendation based on location",
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),

                  SettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: " Safe Mode",
                    subtitle: " Search results is tailored to your needs",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.image,
                    title: " HD Image quality",
                    subtitle: " Set image quality to be seen",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  const SizedBox(
                    height: BabyHubSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("Logout"),
                    ),
                  ),
                  const SizedBox(
                    height: BabyHubSizes.spaceBtwSections * 2.5,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
